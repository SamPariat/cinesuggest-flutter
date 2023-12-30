import 'dart:convert';

import 'package:cinesuggest/api/api.dart';
import 'package:cinesuggest/constants/constants.dart';
import 'package:cinesuggest/models/models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class Auth implements AuthAbstract {
  final String _baseUrl = dotenv.get('BACKEND_URL');
  final _logger = getIt<Logger>();
  final _secureStorage = getIt<SecureStorageAbstract>();

  @override
  Future<Tokens> login(String email, String password) async {
    _logger.i('Calling login($email, $password).');
    final uri = Uri.parse('$_baseUrl/auth/local/login');

    final response = await http.post(
      uri,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> tokensJson = jsonDecode(response.body);

      final tokens = Tokens.fromJson(tokensJson);

      // Save tokens into secure storage
      await _saveTokens(tokens);

      return tokens;
    } else {
      _logException(response);
      throw Exception(
        'Login error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<void> logout() async {
    _logger.i('Calling logout().');
    final uri = Uri.parse('$_baseUrl/auth/local/logout');

    final accessToken =
        await getIt<SecureStorageAbstract>().getKey('access_token');

    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode != 200) {
      _logException(response);
      throw Exception(
        'Logout error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<AuthUser> profile() async {
    _logger.i('Calling profile().');
    throw UnimplementedError();
  }

  @override
  Future<Tokens> refreshTokens(String refreshToken) async {
    _logger.i('Calling refreshTokens($refreshToken).');
    final uri = Uri.parse('$_baseUrl/auth/local/signup');

    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $refreshToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> tokensJson = jsonDecode(response.body);

      final tokens = Tokens.fromJson(tokensJson);

      return tokens;
    } else {
      _logException(response);
      throw Exception(
        'Refresh token error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<Tokens> signup(
    String email,
    String password,
    String name,
  ) async {
    _logger.i('Calling signup($email, $password, $name).');
    final uri = Uri.parse('$_baseUrl/auth/local/signup');

    final response = await http.post(
      uri,
      body: {
        'email': email,
        'password': password,
        'name': name,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> tokensJson = jsonDecode(response.body);

      final tokens = Tokens.fromJson(tokensJson);

      return tokens;
    } else {
      _logException(response);
      throw Exception(
        'Signup error: ${response.reasonPhrase}',
      );
    }
  }

  Future _saveTokens(Tokens tokens) async {
    await _secureStorage.setKey(at, tokens.accessToken);
    await _secureStorage.setKey(rt, tokens.refreshToken);
  }

  void _logException(http.Response response) {
    _logger.e([
      response.reasonPhrase,
      response.statusCode,
    ]);
  }
}
