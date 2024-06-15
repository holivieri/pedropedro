import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'models/user_preferences.dart';
import 'providers/language_provider.dart';
import 'routes/router.dart';
import 'routes/routes.dart';
import 'services/push_notifications_service.dart';
import 'settings/settings_controller.dart';
import 'themes/theme_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    required this.settingsController,
    Key? key,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouterMixin {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    //local notifications

    const initilizationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const initizlizationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initilizationSettingsAndroid,
      iOS: initizlizationSettingsIOS,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    // push notifications
    PushNotificationsService.messageStream.listen((message) {
      /* const snackbar = SnackBar(
        content: Text('Tenes una nueva notificación'),
        backgroundColor: Colors.red,
      );
      messengerKey.currentState?.showSnackBar(snackbar); */
      showNotificationAlert(message);
    });
  }

  Future showNotificationAlert(String? payload) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);

    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecond,
      'Nuevo Mensaje',
      payload,
      platformChannelSpecifics,
      payload: payload ?? '',
    );
  }

  String getInitialRoute() {
    final token = UserPreferences().deviceToken;
    final tokenExpirationDate = UserPreferences().tokenExpirationDate;

    if (token.isEmpty || tokenExpirationDate.isEmpty) {
      //return Routes.loginRoute;
      return Routes.homeRoute;
    }
    if (DateTime.parse(UserPreferences().tokenExpirationDate)
        .toUtc()
        // .subtract(const Duration(days: 30))
        .isBefore(DateTime.now().toUtc())) {
      //token is expired
      //return Routes.loginRoute;
      return Routes.homeRoute;
    } else {
      return Routes.homeRoute;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final languageProvider = Provider.of<LanguageProvider>(context);

        return ChangeNotifierProvider<LanguageProvider>(
          create: (_) => languageProvider,
          child: MaterialApp.router(
            routerConfig: myRouter,
            scaffoldMessengerKey: messengerKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('es', ''),
            ],
            locale: Locale(UserPreferences().selectedLanguage),
            themeMode: themeProvider.themeMode,
            theme: UserPreferences().isDarkModeOn
                ? MyThemes.darkTheme
                : MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
          ),
        );
      },
    );
  }
}
