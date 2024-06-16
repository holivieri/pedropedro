import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:template_app/src/models/user_preferences.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

bool platformIsNotWeb() {
  return !kIsWeb;
}

Future<void> main() async {
  final settingsController = SettingsController(SettingsService());

  final userPreferences = UserPreferences();
  await userPreferences.init();

  await settingsController.loadSettings();
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    UserPreferences().platform = 'web';
  } else {
    if (Platform.isAndroid) {
      UserPreferences().platform = 'android';
    } else if (Platform.isIOS) {
      UserPreferences().platform = 'ios';
    }
  }

  setPathUrlStrategy(); //to remove # from url
  runApp(
    MyApp(
      settingsController: settingsController,
    ),
  );
}
