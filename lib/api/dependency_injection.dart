import 'package:cinesuggest/api/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton<AuthAbstract>(() => Auth());
  getIt.registerLazySingleton<SentimentAbstract>(() => Sentiment());
  getIt.registerLazySingleton<MovieAbstract>(() => Movie());
  getIt.registerLazySingleton<SecureStorageAbstract>(() => SecureStorage());
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<Logger>(() => Logger());
}
