import '../../models/models.dart';

abstract class MovieAbstract {
  Future<List<MovieIdAndTitle>> getAll();

  Future<MovieInfo> getInfo(String movieId);

  Future<TrendingInfo> getLatestTrending();

  Future<CastInfo> getMovieCast(String movieId);

  Future<List<MovieInfo>> getRecommendations(String movieTitle);

  Future<List<TrendingInfo>> getTop5Trending();
}
