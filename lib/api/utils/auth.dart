import './auth_abstract.dart';
import '../../models/models.dart';

class Auth implements AuthAbstract {
  @override
  Future<Tokens> login(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<AuthUser> profile() {
    throw UnimplementedError();
  }

  @override
  Future<Tokens> refreshToken(String refreshToken) {
    throw UnimplementedError();
  }

  @override
  Future<Tokens> signup(String email, String password) {
    throw UnimplementedError();
  }
}
