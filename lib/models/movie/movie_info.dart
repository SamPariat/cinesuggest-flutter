import './movie_common_details.dart';

class MovieInfo extends MovieCommonDetails {
  final String overview;
  final String title;

  MovieInfo({
    required super.imagePath,
    required super.id,
    required super.adult,
    required super.tagline,
    required super.genres,
    required super.releaseDate,
    required this.overview,
    required this.title,
  });

  factory MovieInfo.fromJson(Map<String, dynamic> json) => MovieInfo(
        imagePath: json['imagePath'],
        id: json['id'],
        adult: json['adult'],
        tagline: json['tagline'],
        genres: List<String>.from(json['genres']),
        releaseDate: json['releaseDate'],
        overview: json['overview'],
        title: json['title'],
      );
}
