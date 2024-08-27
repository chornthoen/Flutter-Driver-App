import 'package:dio/dio.dart';

import '../storages/token_storage_provider.dart';

class AuthenticationQueuedInterceptor extends QueuedInterceptor {
  AuthenticationQueuedInterceptor({
    required TokenStorageProvider tokenStorage,
    required String baseUrl,
    bool isRequireAuth = true,
  })  : _tokenStorage = tokenStorage,
        _baseUrl = baseUrl,
        _isRequireAuth = isRequireAuth;

  final String _baseUrl;
  final TokenStorageProvider _tokenStorage;
  final bool _isRequireAuth;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isRequireAuth) {
      final token = await _tokenStorage.readToken();
      final accessToken = token[0];

      if (accessToken != '') {
        final tokenDuration = await _tokenStorage.getAccessTokenDuration();

        // if less than 60 seconds left, refresh token
        if (tokenDuration.inSeconds < 60) {
          try {
            final response = await Dio(
              BaseOptions(
                headers: {
                  'Content-Type': 'application/json',
                },
              ),
            ).post<Map<String, dynamic>>(
              '$_baseUrl/auth/refresh',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $accessToken',
                },
              ),
            );

            if (response.statusCode == 200) {
              if (response.data!['message'] as String == 'success') {
                final accessToken =
                    response.data!['data']['jwt']['access_token'];

                if (accessToken is! String) {
                  throw DioException(requestOptions: options);
                }

                await _tokenStorage.writeToken(
                  accessToken: accessToken,
                );

                options.headers['authorization'] = 'Bearer $accessToken';
                return handler.next(options);
              } else {
                throw DioException(requestOptions: options);
              }
            } else {
              throw DioException(requestOptions: options);
            }
          } on DioException {
            return handler.next(options);
          }
        } else {
          options.headers['authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        }
      } else {
        return handler.next(options);
      }
    } else {
      handler.next(options);
    }
  }
}
