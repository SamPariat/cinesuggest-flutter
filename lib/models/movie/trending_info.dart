import './movie_common_details.dart';

class TrendingInfo extends MovieCommonDetails {
  final String title;

  TrendingInfo({
    required super.imagePath,
    required super.id,
    required super.adult,
    required super.tagline,
    required super.genres,
    required super.releaseDate,
    required this.title,
  });

  factory TrendingInfo.fromJson(Map<String, dynamic> json) => TrendingInfo(
        imagePath: json['imagePath'],
        id: json['id'],
        adult: json['adult'],
        tagline: json['tagline'],
        genres: List<String>.from(json['genres']),
        releaseDate: json['releaseDate'],
        title: json['title'],
      );
}
