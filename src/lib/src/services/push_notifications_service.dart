import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../models/user_preferences.dart';

class PushNotificationsService {
  static FirebaseMessaging firebaseInstance = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();

  static Stream<String> get messageStream => _messageStream.stream;

  static void closeStreams() {
    _messageStream.close();
  }

  void test() {}
  static Future<void> initializeApp() async {
    //Push Notifications
    //https://stackoverflow.com/questions/63799227/fcm-gettoken-failed-to-register-a-serviceworker-for-scope-error-flutter-web/63800226#63800226

    //debugPrint('================ Device TOKEN ================');
    //debugPrint(token);
    UserPreferences().deviceToken = token ?? 'not-set';
  }
}
