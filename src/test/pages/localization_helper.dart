import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:template_app/src/blocs/notifications/notifications_bloc.dart';
import 'package:template_app/src/blocs/users/users_bloc.dart';
import 'package:template_app/src/providers/language_provider.dart';
import 'package:template_app/src/repositories/notifications_repository.dart';
import 'package:template_app/src/repositories/user_repository.dart';
import 'package:template_app/src/services/notifications_service.dart';
import 'package:template_app/src/services/user_service.dart';
import 'package:template_app/src/themes/theme_provider.dart';

import '../mocks/mocks.mocks.dart';

class LocalizationsInj extends StatelessWidget {
  const LocalizationsInj({
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final UserService userService = UserService(MockClient());
    final NotificationsService notificationsService =
        NotificationsService(Client());
    final UserRepository userRepository = UserRepository(userService);
    final NotificationsRespository notificationsRepository =
        NotificationsRespository(notificationsService);

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', ''),
      ],
      locale: const Locale('es'),
      home: MultiBlocProvider(
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
            ChangeNotifierProvider<ThemeProvider>(
                create: (_) => ThemeProvider()),
            ChangeNotifierProvider<LanguageProvider>(
                create: (_) => LanguageProvider()),
          ],
          child: child,
        ),
      ),
    );
  }
}
