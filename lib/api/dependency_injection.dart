import 'package:cinesuggest/api/api.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton<AuthAbstract>(() => Auth());
  getIt.registerLazySingleton<SentimentAbstract>(() => Sentiment());
  getIt.registerLazySingleton<MovieAbstract>(() => Movie());
}
