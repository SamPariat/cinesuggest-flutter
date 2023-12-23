import 'package:cinesuggest/constants/constants.dart';
import 'package:cinesuggest/screens/screens.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Try more',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed(
                HomeScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.recommend),
            title: const Text('Recommend'),
            onTap: () {
              Navigator.of(context).pushNamed(
                RecommendationScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.trending_up),
            title: const Text('Trending'),
            onTap: () {
              Navigator.of(context).pushNamed(
                TrendingScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              Navigator.of(context).pushNamed(
                LoginScreen.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
