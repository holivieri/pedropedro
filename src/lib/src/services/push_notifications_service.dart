import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

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

    if (kIsWeb) {
      //TODO init Firebase
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: '',
          appId: '',
          messagingSenderId: '',
          projectId: '',
        ),
      );
    } else {
      //TODO init Firebase
      // await Firebase.initializeApp();
      // token = await firebaseInstance.getToken();
    }

    //debugPrint('================ Device TOKEN ================');
    //debugPrint(token);
    UserPreferences().deviceToken = token ?? 'not-set';

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //Local Notifications
  }

  static Future _onBackgroundHandler(RemoteMessage message) async {
    debugPrint('background handler: ${message.messageId}');
    _messageStream.add(message.notification?.body ?? 'Sin Titulo');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    debugPrint('_onMessageHandler handler: ${message.messageId}');
    _messageStream.add(message.notification?.body ?? 'Sin Titulo');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    debugPrint('_onMessageOpenApp handler: ${message.messageId}');
    _messageStream.add(message.notification?.body ?? 'Sin Titulo');
  }
}
