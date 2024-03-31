import 'package:bootcamp_repository/bootcamp_repository.dart';
import 'package:camper_api/camper_api.dart';
import 'package:camper_app/src/router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:user_repository/user_repository.dart';

void init() {
  sl.registerLazySingleton<GoRouter>(
      () => goRouter(userRepository: sl<UserRepository>()));
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  sl.registerLazySingleton<CamperApi>(
    () => CamperApi(getToken: () async {
      final repo = sl<UserRepository>();
      return repo.getUserToken();
    }),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepository(camperApi: sl<CamperApi>()),
  );

  sl.registerLazySingleton<BootCampRepository>(
    () => BootCampRepository(api: sl<CamperApi>()),
  );
}

final sl = GetIt.instance;
