import 'package:clean_car_customer_v2/features/campaigns/data/repo/campaigns_repo.dart';
import 'package:clean_car_customer_v2/features/notification/data/repo/notifications_repo.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservation_details/data/repo/change_status_repository.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/data/repo/reservations_repository.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/faq/data/repository/faq_repository.dart';
import 'package:clean_car_customer_v2/utils/language/repo/language_repository.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/analytics/analytic_logger.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/services/local/interceptor.dart';
import 'data/services/local/storage_service.dart';
import 'data/services/remote/global_service.dart';
import 'features/branches_and_reservation/reservation/data/repo/reservation_parameters_repo.dart';
import 'features/branches_and_reservation/reservation/data/repo/reservation_submit_repo.dart';
import 'features/branches_and_reservation/reservation/data/repo/reservation_update_repo.dart';
import 'features/evaluation/data/repo/rating_repo.dart';
import 'features/home/data/repo/filial_repo.dart';
import 'features/home/data/repo/regions_repo.dart';
import 'features/home/data/repo/services_repo.dart';
import 'features/login/data/repo/login_repository.dart';
import 'features/notification/data/repo/read_notifications_repo.dart';
import 'features/offers/data/repo/offers_repo.dart';
import 'features/onboadding_and_sign_up/otp/data/repository/otp_repository.dart';
import 'features/onboadding_and_sign_up/signup/data/repository/sign_up_repository.dart';
import 'features/onboadding_and_sign_up/signup/data/repository/terms_repository.dart';
import 'features/profile_section/my_cars/data/repo/ban_types_repo.dart';
import 'features/profile_section/my_cars/data/repo/my_cars_repo.dart';
import 'features/profile_section/personal_info/data/repo/profile_info_repository.dart';
import 'features/profile_section/settings/features/change_lang/data/repo/languages_repo.dart';
import 'features/profile_section/settings/features/contacts/data/repo/contacts_repo.dart';

final locator = GetIt.I;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<StorageService>(() => StorageService());
  Dio clientGlobal = Dio(BaseOptions(
      validateStatus: (status) => (status! < 500),
      connectTimeout: Duration(seconds: 20),
      sendTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20)))
    ..interceptors.add(ClientInterceptor());

  locator.registerLazySingleton<Dio>(() => clientGlobal);
  locator.registerLazySingleton<EventLogger>(() => EventLogger()..init());
  locator.registerLazySingleton<GlobalService>(() => GlobalService());
  locator.registerLazySingleton<LanguageRepository>(() => LanguageRepository());
  locator.registerLazySingleton<SignUpRepository>(() => SignUpRepository());
  locator.registerLazySingleton<OTPRepository>(() => OTPRepository());
  locator.registerLazySingleton<RegionsRepository>(() => RegionsRepository());
  locator.registerLazySingleton<BranchsRepository>(() => BranchsRepository());
  locator.registerLazySingleton<OffersRepository>(() => OffersRepository());
  locator.registerLazySingleton<LoginRepository>(() => LoginRepository());
  locator.registerLazySingleton<FaqRepository>(() => FaqRepository());
  locator.registerLazySingleton<ProfileInfoRepository>(
      () => ProfileInfoRepository());
  locator.registerLazySingleton<ReservationsRepository>(
      () => ReservationsRepository());
  locator.registerLazySingleton<MyCarsRepository>(() => MyCarsRepository());
  locator.registerLazySingleton<BanTypesRepository>(() => BanTypesRepository());
  locator.registerLazySingleton<ServicesRepository>(() => ServicesRepository());
  locator.registerLazySingleton<ReservationParametersRepository>(
      () => ReservationParametersRepository());
  locator.registerLazySingleton<ReservationSubmitRepo>(
      () => ReservationSubmitRepo());
  locator
      .registerLazySingleton<LanguagesRepository>(() => LanguagesRepository());
  locator.registerLazySingleton<ContacsRepository>(() => ContacsRepository());
  locator.registerLazySingleton<ReservationUpdateRepo>(
      () => ReservationUpdateRepo());
  locator.registerLazySingleton<TermsRepository>(() => TermsRepository());
  locator.registerLazySingleton<ChangeStatusEnableDisableRepository>(
      () => ChangeStatusEnableDisableRepository());
  locator.registerLazySingleton<RatingRepository>(
      () => RatingRepository());
  locator.registerLazySingleton<CampaignsRepository>(
      () => CampaignsRepository());
  locator.registerLazySingleton<NotificationsRepository>(
      () => NotificationsRepository());
  locator.registerLazySingleton<ReadNotificationsRepository>(
      () => ReadNotificationsRepository());
}
