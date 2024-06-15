import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/src/routes/routes.dart';
import '../models/user_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return mainBody(context);
  }

  Widget mainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getHeaderBar(),
          const SizedBox(height: 40),
          getOptions(),
        ],
      ),
    );
  }

  Widget getOptions() {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: Colors.green,
          ),
          onPressed: () {
            GoRouter.of(context).pushNamed(Routes.resultRoute);
          },
          child: const Text('¿Puedo cirujear?'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            GoRouter.of(context).pushNamed(Routes.resultRoute);
          },
          child: const Text('¿Puedo comprar boludeces?'),
        ),
      ],
    );
  }

  Widget getHeaderBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: 'logoTag',
            child: Image.asset(
              'assets/images/Logo_small.png',
              height: 50,
            ),
          ),
          IconButton(
            onPressed: () {
              // showSearch(context: context, delegate: SeachArtistDelegate());
            },
            icon: Icon(
              Icons.search,
              size: 30,
              color:
                  UserPreferences().isDarkModeOn ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
