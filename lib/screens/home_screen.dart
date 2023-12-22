import 'package:cinesuggest/constants/constants.dart';
import 'package:cinesuggest/screens/screens.dart';
import 'package:cinesuggest/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingText(text: 'CineSuggest'),
                Center(
                  child: Image(
                    image: const AssetImage(
                      'assets/images/cinesuggest-3d-image-red.png',
                    ),
                    width: imageWidth,
                  ),
                ),
                const HeadingDescription(
                  text: cineSuggestDescription,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        TrendingScreen.routeName,
                      );
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Get Started',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.skip_next_outlined),
                      ],
                    ),
                  ),
                ),
                const Text(
                  disclaimer,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeadingText(text: 'Cosine Similarity'),
                Center(
                  child: Image(
                    image: const AssetImage(
                      'assets/images/cosine-similarity-3d.png',
                    ),
                    width: imageWidth,
                  ),
                ),
                const HeadingDescription(
                  text: cosineSimilarityDescription,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeadingText(text: 'Naive Bayes'),
                Center(
                  child: Image(
                    image: const AssetImage(
                      'assets/images/naive-bayes-3d.png',
                    ),
                    width: imageWidth,
                  ),
                ),
                const HeadingDescription(
                  text: naiveBayesDescription,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
