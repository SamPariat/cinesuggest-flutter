import 'package:cinesuggest/constants/constants.dart';
import 'package:cinesuggest/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TrendingScreen extends StatelessWidget {
  static const routeName = '/trending';

  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      appBar: AppBar(title: const Text('Trending')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeadingText(text: 'Trending'),
              ScreenImage(
                imagePath: 'assets/images/trending-3d.png',
                imageWidth: imageWidth,
              ),
              const HeadingDescription(text: trendingDescription),
            ],
          ),
        ),
      ),
    );
  }
}
