import 'package:get_it/get_it.dart';
import 'package:youtube_playlist_app/data/singletons/dio_settings.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator.registerLazySingleton(() => DioSettings());
}
