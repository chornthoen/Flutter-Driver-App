part of 'environment_cubit.dart';

enum EnvironmentStatus { initial, loading, success, failure }

class EnvironmentState extends Equatable {
  const EnvironmentState({
    this.status = EnvironmentStatus.initial,
    this.environment = Environment.isEmpty,
    this.message,
  });

  // initial
  factory EnvironmentState.initial() => const EnvironmentState();

  final EnvironmentStatus status;
  final Environment environment;
  final String? message;

  // copyWith
  EnvironmentState copyWith({
    EnvironmentStatus? status,
    Environment? environment,
    String? message,
  }) {
    return EnvironmentState(
      status: status ?? this.status,
      environment: environment ?? this.environment,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, environment];
}
