import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  factory Storage() => _instance;

  Storage._internal();

  // Singleton
  static final Storage _instance = Storage._internal();

  // Storage
  late SharedPreferences _storage;

  // Initialize
  Future<void> initial() async {
    _storage = await SharedPreferences.getInstance();
  }

  // Set
  Future<bool> set(String key, dynamic value) async {
    if (value is String) {
      return _storage.setString(key, value);
    } else if (value is int) {
      return _storage.setInt(key, value);
    } else if (value is double) {
      return _storage.setDouble(key, value);
    } else if (value is bool) {
      return _storage.setBool(key, value);
    } else if (value is List<String>) {
      return _storage.setStringList(key, value);
    } else if (value is Map<String, dynamic>) {
      final json = jsonEncode(value);
      return _storage.setString(key, json);
    } else {
      return false;
    }
  }

  // Get string
  String? getString(String key) {
    return _storage.getString(key);
  }

  // Get int
  int? getInt(String key) {
    return _storage.getInt(key);
  }

  // Get double
  double? getDouble(String key) {
    return _storage.getDouble(key);
  }

  // Get bool
  bool getBool(String key) {
    return _storage.getBool(key) ?? false;
  }

  // Get list string
  List<String>? getListString(String key) {
    return _storage.getStringList(key);
  }

  // Get map
  Map<String, dynamic>? getMap(String key) {
    final json = _storage.getString(key);
    if (json != null) {
      final map = jsonDecode(json);
      if (map is Map<String, dynamic>) {
        return map;
      }
    }
    return null;
  }

  // Remove
  Future<bool> remove(String key) async {
    return _storage.remove(key);
  }

  // Clear
  Future<bool> clear() async {
    return _storage.clear();
  }

  // Contains
  bool contains(String key) {
    return _storage.containsKey(key);
  }

  // Get all keys
  Set<String> getKeys() {
    return _storage.getKeys();
  }

  // constant keys
  static const String onboardLoading = 'onboardLoading';
  static const String user = 'user';
  static const String accessToken = 'accessToken';

  // Get user
  Map<String, dynamic>? getUser() {
    return getMap(user);
  }
}
