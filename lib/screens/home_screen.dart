import 'package:cinesuggest/constants/constants.dart';
import 'package:cinesuggest/screens/screens.dart';
import 'package:cinesuggest/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  Future<void> _linkToWebsite() async {
    final url = dotenv.get('FRONTEND_URL');
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Unable to launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(text: 'CineSuggest'),
                  Center(
                    child: ScreenImage(
                      imagePath: 'assets/images/cinesuggest-3d-image-red.png',
                      imageWidth: imageWidth,
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
                    child: ScreenImage(
                      imagePath: 'assets/images/cosine-similarity-3d.png',
                      imageWidth: imageWidth,
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
                    child: ScreenImage(
                      imagePath: 'assets/images/naive-bayes-3d.png',
                      imageWidth: imageWidth,
                    ),
                  ),
                  const HeadingDescription(
                    text: naiveBayesDescription,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextButton.icon(
                onPressed: _linkToWebsite,
                icon: const Icon(Icons.web),
                label: const Text('Try the website'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
