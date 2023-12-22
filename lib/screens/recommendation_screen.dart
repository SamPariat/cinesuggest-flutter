import 'package:flutter/material.dart';

class RecommendationScreen extends StatelessWidget {
  static const routeName = '/recommend';

  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommendations')),
    );
  }
}
