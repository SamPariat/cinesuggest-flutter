import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final String routeName = '/movie';

  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie')),
      body: const Column(
        children: [],
      ),
    );
  }
}
