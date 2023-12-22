import './movie_id_and_title.dart';

class AllMovies {
  final List<MovieIdAndTitle> diccArr;

  AllMovies({
    required this.diccArr,
  });

  factory AllMovies.fromJson(Map<String, dynamic> json) => AllMovies(
        diccArr: List.from(json['dicc_arr']),
      );
}
