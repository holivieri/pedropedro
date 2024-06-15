import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:template_app/src/pages/recommendations_page.dart';

import '../models/user_preferences.dart';
import '../themes/theme_provider.dart';
import 'home_screen.dart';
import 'notifications_page.dart';
import 'user_proferences_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final tabs = [
    const HomeScreen(),
    const RecommendationsPage(),
    const NotificationsPage(),
    const UserPreferencesPage(),
  ];

  @override
  void initState() {
    super.initState();
    _assignUser();
  }

  Future<void> _assignUser() async {
    final String userName = UserPreferences().userName;

    if (userName.isNotEmpty) {
      //  final AnalyticService analyticService = AnalyticService();
      //  await analyticService.setUserProperties(userName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: tabs[_selectedIndex],
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: Colors.grey),
                  ],
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BottomNavigationBar(
                  backgroundColor: theme.getControlColor(),
                  currentIndex: _selectedIndex,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.home_rounded),
                      label: AppLocalizations.of(context)!.home,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.newspaper_outlined),
                      label: AppLocalizations.of(context)!.bulletin,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.notifications),
                      label: AppLocalizations.of(context)!.notifications,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.person),
                      label: AppLocalizations.of(context)!.profile,
                    ),
                  ],
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  selectedItemColor: theme.getSelectedIconColor(),
                  unselectedItemColor: Colors.grey,
                )),
          ),
        ),
      ),
    );
  }
}
