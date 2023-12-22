import '../../models/models.dart';

abstract class AuthAbstract {
  Future<Tokens> login(String email, String password);

  Future<Tokens> signup(String email, String password);

  Future<AuthUser> profile();

  Future<void> logout();

  Future<Tokens> refreshToken(String refreshToken);
}
