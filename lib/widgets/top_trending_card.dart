import 'package:cinesuggest/models/models.dart';
import 'package:cinesuggest/screens/screens.dart';
import 'package:flutter/material.dart';

class TopTrendingCard extends StatelessWidget {
  final TrendingInfo trendingInfo;

  const TopTrendingCard({
    super.key,
    required this.trendingInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 200,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Ink.image(
                image: NetworkImage(trendingInfo.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Text(
                  trendingInfo.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  trendingInfo.tagline,
                  maxLines: 5,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MovieScreen(
                        movieId: trendingInfo.id,
                        movieTitle: trendingInfo.title,
                      ),
                    ),
                  );
                },
                child: const Text('Movie Information'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('User Reviews'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
