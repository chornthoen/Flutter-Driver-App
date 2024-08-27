import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getFCMToken() async {
  if (Platform.isIOS) {
    final String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }
  final String? token = await FirebaseMessaging.instance.getToken();
  return token;
}
