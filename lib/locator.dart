import 'package:clean_car_customer_v2/utils/language/repo/language_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/services/local/interceptor.dart';
import 'data/services/local/storage_service.dart';
import 'data/services/remote/global_service.dart';
import 'features/home/data/repo/filial_repo.dart';
import 'features/home/data/repo/regions_repo.dart';
import 'features/login/data/repo/login_repository.dart';
import 'features/offers/data/repo/offers_repo.dart';
import 'features/onboadding_and_sign_up/otp/data/repository/otp_repository.dart';
import 'features/onboadding_and_sign_up/signup/data/repository/sign_up_repository.dart';

final locator = GetIt.I;

void setUpLocator() {
  locator.registerLazySingleton<StorageService>(() => StorageService()..init());
  Dio clientGlobal =
      Dio(BaseOptions(validateStatus: (status) => (status! < 500)))
        ..interceptors.add(ClientInterceptor());

  locator.registerLazySingleton<Dio>(() => clientGlobal);
  locator.registerLazySingleton<GlobalService>(() => GlobalService());
  locator.registerLazySingleton<LanguageRepository>(() => LanguageRepository());
  locator.registerLazySingleton<SignUpRepository>(() => SignUpRepository());
  locator.registerLazySingleton<OTPRepository>(() => OTPRepository());
  locator.registerLazySingleton<RegionsRepository>(() => RegionsRepository());
  locator.registerLazySingleton<BranchsRepository>(() => BranchsRepository());
  locator.registerLazySingleton<OffersRepository>(() => OffersRepository());
  locator.registerLazySingleton<LoginRepository>(() => LoginRepository());
}
