import '../../models/models.dart';

abstract class MovieAbstract {
  Future<List<AllMoviesInfo>> getAll();

  Future<MovieInfo> getInfo(int movieId);

  Future<TrendingInfo> getLatestTrending();

  Future<CastInfo> getMovieCast(int movieId);

  Future<List<MovieInfo>> getRecommendations(String movieTitle);

  Future<List<TrendingInfo>> getTop5Trending();
}
