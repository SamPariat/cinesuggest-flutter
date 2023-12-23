import 'package:cinesuggest/api/api.dart';
import 'package:cinesuggest/constants/constants.dart';
import 'package:cinesuggest/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecommendationScreen extends StatelessWidget {
  static const routeName = '/recommend';

  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommendations')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const HeadingText(text: 'Find Similar Movies'),
              const HeadingDescription(text: recommendationsDescription),
              const SizedBox(height: 10),
              FutureBuilder(
                future: Movie.getAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RecommendationTable(allMovies: snapshot.data!);
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: Text(
                        'Loading the movies...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }
                  return const Text('Error');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
