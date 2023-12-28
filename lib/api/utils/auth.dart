import 'dart:convert';

import 'package:cinesuggest/api/api.dart';
import 'package:cinesuggest/constants/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../models/models.dart';

class Auth implements AuthAbstract {
  final String _baseUrl = dotenv.get('BACKEND_URL');

  @override
  Future<Tokens> login(String email, String password) async {
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
      throw Exception(
        'Login error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<void> logout() async {
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
      throw Exception(
        'Logout error: ${response.reasonPhrase}',
      );
    }
  }

  @override
  Future<AuthUser> profile() async {
    throw UnimplementedError();
  }

  @override
  Future<Tokens> refreshTokens(String refreshToken) async {
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
      throw Exception(
        'Signup error: ${response.reasonPhrase}',
      );
    }
  }

  Future _saveTokens(Tokens tokens) async {
    await getIt<SecureStorageAbstract>().setKey(
      at,
      tokens.accessToken,
    );
    await getIt<SecureStorageAbstract>().setKey(
      rt,
      tokens.refreshToken,
    );
  }
}
