import 'package:cinesuggest/api/data/secure_storage_abstract.dart';

class SecureStorage implements SecureStorageAbstract {
  @override
  Future deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future deleteKey(String key) {
    // TODO: implement deleteKey
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<String> getKey(String key) {
    // TODO: implement getKey
    throw UnimplementedError();
  }

  @override
  Future setKey(String key, String value) {
    // TODO: implement setKey
    throw UnimplementedError();
  }
}
