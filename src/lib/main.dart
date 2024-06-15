import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:template_app/src/blocs/users/users_bloc.dart';
import 'package:template_app/src/models/user_preferences.dart';

import 'src/app.dart';
import 'src/blocs/notifications/notifications_bloc.dart';
import 'src/providers/language_provider.dart';
import 'src/repositories/notifications_repository.dart';
import 'src/repositories/user_repository.dart';
import 'src/services/notifications_service.dart';
import 'src/services/push_notifications_service.dart';
import 'src/services/user_service.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/themes/theme_provider.dart';

bool platformIsNotWeb() {
  return !kIsWeb;
}

Future<void> main() async {
  final settingsController = SettingsController(SettingsService());

  final UserService userService = UserService(Client());
  final NotificationsService notificationsService =
      NotificationsService(Client());
  final UserRepository userRepository = UserRepository(userService);

  final NotificationsRespository notificationsRepository =
      NotificationsRespository(notificationsService);

  final userPreferences = UserPreferences();
  await userPreferences.init();

  await settingsController.loadSettings();
  WidgetsFlutterBinding.ensureInitialized();

  await PushNotificationsService.initializeApp();

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
    MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(
          create: (BuildContext context) =>
              UsersBloc(userRepository)..add(InitializeUser()),
        ),
        BlocProvider<NotificationsBloc>(
          create: (BuildContext context) =>
              NotificationsBloc(notificationsRepository)
                ..add(GettingUserNotifications()),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
          ChangeNotifierProvider<LanguageProvider>(
              create: (_) => LanguageProvider()),
        ],
        child: GestureDetector(
          onTap: () {
            //to minimize the keyboard when tapping outside of a Textfield.
            //Can move to MyApp to implement in the entire app
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MyApp(
            settingsController: settingsController,
          ),
        ),
      ),
    ),
  );
}
