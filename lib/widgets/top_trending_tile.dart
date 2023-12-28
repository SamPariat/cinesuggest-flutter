import 'package:cinesuggest/models/models.dart';
import 'package:flutter/material.dart';

class TopTrendingTile extends StatelessWidget {
  final TrendingInfo trendingInfo;

  const TopTrendingTile({
    super.key,
    required this.trendingInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        trendingInfo.title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        trendingInfo.tagline,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Image(
        image: NetworkImage(trendingInfo.imagePath),
      ),
    );
  }
}
