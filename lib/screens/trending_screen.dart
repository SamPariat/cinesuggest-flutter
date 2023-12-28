import 'package:cinesuggest/api/api.dart';
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
              const SizedBox(height: 10),
              const SubHeadingText(text: 'Highest Trending Movie'),
              const SizedBox(height: 10),
              FutureBuilder(
                future: getIt<MovieAbstract>().getLatestTrending(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    );
                  }
                  return TopTrendingCard(trendingInfo: snapshot.data!);
                },
              ),
              const SizedBox(height: 10),
              const SubHeadingText(text: 'More Trending Movies'),
              const SizedBox(height: 10),
              FutureBuilder(
                future: getIt<MovieAbstract>().getTop5Trending(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (_, index) => TopTrendingTile(
                      trendingInfo: snapshot.data![index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
