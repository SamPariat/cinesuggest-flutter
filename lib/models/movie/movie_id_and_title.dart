class MovieIdAndTitle {
  final int id;
  final String title;

  MovieIdAndTitle({
    required this.id,
    required this.title,
  });

  factory MovieIdAndTitle.fromJson(Map<String, dynamic> json) =>
      MovieIdAndTitle(
        id: json['id'],
        title: json['title'],
      );
}
