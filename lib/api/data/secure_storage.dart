import 'package:cinesuggest/api/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage implements SecureStorageAbstract {
  @override
  Future deleteAll() async {
    await getIt<FlutterSecureStorage>().deleteAll();
  }

  @override
  Future deleteKey(String key) async {
    await getIt<FlutterSecureStorage>().delete(key: key);
  }

  @override
  Future<Map<String, String>> getAll() async {
    final allKvs = await getIt<FlutterSecureStorage>().readAll();
    return allKvs;
  }

  @override
  Future<String> getKey(String key) async {
    final value = await getIt<FlutterSecureStorage>().read(key: key);

    if (value == null) {
      throw Exception('This key does not exist in memory');
    }

    return value;
  }

  @override
  Future setKey(String key, String value) async {
    await getIt<FlutterSecureStorage>().write(key: key, value: value);
  }
}
