import 'package:flutter/material.dart';

class TrendingScreen extends StatelessWidget {
  static const routeName = '/trending';

  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trending')),
    );
  }
}
