import 'package:flutter/cupertino.dart';

import '../models/user_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('es');

  Locale get currentLocale => _currentLocale;

  void changeLocale(String language) {
    _currentLocale = Locale(language);
    UserPreferences().selectedLanguage = language;
    notifyListeners();
  }
}
