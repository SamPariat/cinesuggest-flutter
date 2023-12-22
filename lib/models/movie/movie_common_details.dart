import './common_details.dart';

class MovieCommonDetails extends CommonDetails {
  final int id;
  final bool adult;
  final String tagline;
  final List<String> genres;
  final String releaseDate;

  MovieCommonDetails({
    required super.imagePath,
    required this.id,
    required this.adult,
    required this.tagline,
    required this.genres,
    required this.releaseDate,
  });

  factory MovieCommonDetails.fromJson(Map<String, dynamic> json) =>
      MovieCommonDetails(
        imagePath: json['imagePath'],
        id: json['id'],
        adult: json['adult'],
        tagline: json['tagline'],
        genres: List.from(json['genres']),
        releaseDate: json['releaseDate'],
      );
}
