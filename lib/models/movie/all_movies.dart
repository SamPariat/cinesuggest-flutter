import './all_movies_info.dart';

class AllMovies {
  final List<AllMoviesInfo> diccArr;

  AllMovies({
    required this.diccArr,
  });

  factory AllMovies.fromJson(Map<String, dynamic> json) => AllMovies(
        diccArr: List.from(json['dicc_arr']),
      );
}
