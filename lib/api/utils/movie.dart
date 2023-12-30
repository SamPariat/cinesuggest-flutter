import 'dart:convert';

import 'package:cinesuggest/api/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../models/models.dart';

class Movie implements MovieAbstract {
  final String _baseUrl = dotenv.get('BACKEND_URL');
  final _logger = getIt<Logger>();

  @override
  Future<List<MovieIdAndTitle>> getAll() async {
    _logger.i('Calling getAll()');
    final uri = Uri.parse('$_baseUrl/movie/all');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['dicc_arr'] as List)
          .map(
            (movieJson) => MovieIdAndTitle.fromJson(movieJson),
          )
          .toList();
    } else {
      _logException(response);
      throw Exception(
        'All movies error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<MovieInfo> getInfo(int movieId) async {
    _logger.i('Calling getInfo($movieId)');
    final uri = Uri.parse('$_baseUrl/movie/info').replace(
      queryParameters: {
        'id': movieId.toString(),
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return MovieInfo.fromJson(
        jsonDecode(response.body),
      );
    } else {
      _logException(response);
      throw Exception(
        'Movie info error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<TrendingInfo> getLatestTrending() async {
    _logger.i('Calling getLatestTrending()');
    final uri = Uri.parse('$_baseUrl/movie/latest-trending');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      return TrendingInfo.fromJson(json['latestTrending']);
    } else {
      _logException(response);
      throw Exception(
        'Latest trending error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<CastInfo> getMovieCast(int movieId) async {
    _logger.i('Calling getMovieCast($movieId)');
    final uri = Uri.parse('$_baseUrl/movie/cast');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return CastInfo.fromJson(
        response.body as Map<String, dynamic>,
      );
    } else {
      _logException(response);
      throw Exception(
        'Movie cast error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<List<MovieInfo>> getRecommendations(String movieTitle) async {
    _logger.i('Calling getRecommendations($movieTitle)');
    final uri = Uri.parse('$_baseUrl/model/recommendations').replace(
      queryParameters: {
        'movie': movieTitle,
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      return (json as List)
          .map(
            (recommendation) => MovieInfo.fromJson(recommendation),
          )
          .toList();
    } else {
      _logException(response);
      throw Exception(
        'Recommendations error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<List<TrendingInfo>> getTop5Trending() async {
    _logger.i('Calling getTop5Trending()');
    final uri = Uri.parse('$_baseUrl/movie/top-5-trending');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      return (json['top5Trending'] as List)
          .map(
            (trending) => TrendingInfo.fromJson(trending),
          )
          .toList();
    } else {
      _logException(response);
      throw Exception(
        'Top 5 trending error: ${response.reasonPhrase}',
      );
    }
  }

  void _logException(http.Response response) {
    _logger.e([
      response.reasonPhrase,
      response.statusCode,
    ]);
  }
}
