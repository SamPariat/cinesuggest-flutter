import 'dart:convert';

import 'package:cinesuggest/api/utils/movie_abstract.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../models/models.dart';

class Movie implements MovieAbstract {
  static String baseUrl = dotenv.get('BACKEND_URL');

  @override
  Future<List<MovieIdAndTitle>> getAll() async {
    final uri = Uri.parse('$baseUrl/movie/all');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> movieListJson = jsonDecode(response.body)['dicc_arr'];

      final List<MovieIdAndTitle> movies = movieListJson
          .map((movieJson) => MovieIdAndTitle.fromJson(movieJson))
          .toList();

      return movies;
    } else {
      throw Exception(
        'All movies error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<MovieInfo> getInfo(String movieId) {
    throw UnimplementedError();
  }

  @override
  Future<TrendingInfo> getLatestTrending() async {
    final uri = Uri.parse('$baseUrl/movie/latest-trending');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return TrendingInfo.fromJson(
        jsonDecode(
          (response.body as Map<String, dynamic>)['latestTrending'],
        ),
      );
    } else {
      throw Exception(
        'Latest trending error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<CastInfo> getMovieCast(String movieId) async {
    final uri = Uri.parse('$baseUrl/movie/cast');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return CastInfo.fromJson(
        response.body as Map<String, dynamic>,
      );
    } else {
      throw Exception('Movie cast error: ${response.reasonPhrase}');
    }
  }

  @override
  Future<List<MovieInfo>> getRecommendations(String movieTitle) {
    throw UnimplementedError();
  }

  @override
  Future<List<TrendingInfo>> getTop5Trending() {
    throw UnimplementedError();
  }
}
