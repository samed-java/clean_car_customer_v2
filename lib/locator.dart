
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/services/local/interceptor.dart';
import 'data/services/local/storage_service.dart';
import 'data/services/remote/global_service.dart';

final locator = GetIt.I;

void setUpLocator() {
  locator.registerLazySingleton<StorageService>(() => StorageService());
  Dio clientGlobal =
      Dio(BaseOptions(validateStatus: (status) => (status! < 500)))
        ..interceptors.add(ClientInterceptor());

  locator.registerLazySingleton<Dio>(() => clientGlobal);
  locator.registerLazySingleton<GlobalService>(() => GlobalService());
}
