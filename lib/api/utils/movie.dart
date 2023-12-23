import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../models/models.dart';

class Movie {
  static String baseUrl = dotenv.get('BACKEND_URL');

  static Future<List<MovieIdAndTitle>> getAll() async {
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

  static Future<MovieInfo> getInfo(String movieId) {
    throw UnimplementedError();
  }

  static Future<TrendingInfo> getLatestTrending() async {
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

  static Future<CastInfo> getMovieCast(String movieId) async {
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

  Future<List<MovieInfo>> getRecommendations(String movieTitle) {
    throw UnimplementedError();
  }

  static Future<List<TrendingInfo>> getTop5Trending() {
    throw UnimplementedError();
  }
}
