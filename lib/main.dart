import 'package:cinesuggest/constants/constants.dart';
import 'package:cinesuggest/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineSuggest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
          error: destructiveColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primaryColor),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
        ),
        textTheme: GoogleFonts.ralewayTextTheme(),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        RecommendationScreen.routeName: (context) =>
            const RecommendationScreen(),
        TrendingScreen.routeName: (context) => const TrendingScreen(),
      },
    );
  }
}
