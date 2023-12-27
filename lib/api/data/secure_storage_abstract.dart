abstract class SecureStorageAbstract {
  Future deleteAll();

  Future deleteKey(String key);

  Future<String> getKey(String key);

  Future<Map<String, String>> getAll();

  Future setKey(String key, String value);
}
