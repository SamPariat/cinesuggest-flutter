class AllMoviesInfo {
  final int id;
  final String title;
  final List<String> genres;

  AllMoviesInfo({
    required this.id,
    required this.title,
    required this.genres,
  });

  factory AllMoviesInfo.fromJson(Map<String, dynamic> json) => AllMoviesInfo(
        id: json['id'],
        title: json['title'],
        genres: List<String>.from(json['genres']),
      );
}
