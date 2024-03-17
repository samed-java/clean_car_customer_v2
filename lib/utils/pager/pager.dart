import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/branch_screen.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/branches_screen.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/cubit/reservation_cubit.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/reservation_screen.dart';
import 'package:clean_car_customer_v2/features/evaluation/evaluation_screen.dart';
import 'package:clean_car_customer_v2/features/home/cubit/home_cubit.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';
import 'package:clean_car_customer_v2/features/home/home_screen.dart';
import 'package:clean_car_customer_v2/features/login/cubit/login_cubit.dart';
import 'package:clean_car_customer_v2/features/login/login_screen.dart';
import 'package:clean_car_customer_v2/features/main/main_screen.dart';
import 'package:clean_car_customer_v2/features/offers/detailed_offers/detailed_offer_screen.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/onboarding/onboarding.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/otp/data/cubit/otp_cubit.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/otp/otp_screen.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/components/terms_and_agreement.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/data/cubit/sign_up_cubit.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/signup_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/my_cars_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/personal_info_edit_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/personal_info_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/profile/profile_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservation_details/cubit/change_status_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservation_details/reservation_detail_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/cubit/reservations_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/data/model/reservations_model.dart'
    as m;
import 'package:clean_car_customer_v2/features/profile_section/reservations/reservations_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/change_lang/cubit/languages_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/contacts/cubit/contacts_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/faq/cubit/faq_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/features/faq/presentation/faq_screen.dart';
import 'package:clean_car_customer_v2/features/splash/splash_begin_screen.dart';
import 'package:clean_car_customer_v2/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import '../../features/offers/cubit/offers_cubit.dart';
import '../../features/offers/data/model/res/offers_res_model.dart';
import '../../features/profile_section/my_cars/cubit/my_cars_cubit.dart';
import '../../features/profile_section/my_cars/data/model/res/my_cars_res_model.dart';
import '../../features/profile_section/personal_info/cubit/profile_info/profile_info_cubit.dart';
import '../../features/profile_section/settings/features/change_lang/presentation/languages.dart';
import '../../features/profile_section/settings/features/contacts/presentation/contacts_page.dart';
import '../../features/profile_section/settings/settings.dart';

class Pager {
  static Widget get onboarding => const OnboardingScreen();
  static Widget get login => BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginScreen(),
      );
  static Widget get otp => BlocProvider(
        create: (context) => OTPCubit(),
        child: const OTPScreen(),
      );
  static Widget get main => MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            //lazy: true,
            create: (context) => HomeCubit()..execute(),
          ),
          BlocProvider<OffersCubit>(
            //lazy: false,
            create: (context) => OffersCubit()..execute(),
          ),
        ],
        child: const MainScreen(),
      );
  static Widget get signup => BlocProvider<SignUpCubit>(
        create: (context) => SignUpCubit()..init(),
        child: SignupScreen(),
      );
  static Widget get home => const HomeScreen();
  static Widget get branches => const BranchesScreen();
  static Widget branch(Washing model) => BranchScreen(
        model: model,
      );
  static Widget reservation(
          {
            bool isNew = true,
            bool isRenewNew = false,
          String? id,
          Branch? branch,
          Car? car,
          Time? time,
          Service? service,
          DateTime? dateTime}) =>
      MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ReservationCubit(
                  isNew: isNew,
                  isRenew: isRenewNew,
                  reservationId: id,
                  branch: branch,
                  car: car,
                  service: service,
                  time: time,
                  dateTime: dateTime)
                ..execute()),
          BlocProvider(
              lazy: false, create: (context) => MyCarsCubit()..getBanTypes())
        ],
        child: const ReservationScreen(),
      );
  static Widget get profile => const ProfileScreen();
  static Widget get personalInfo => BlocProvider(
        create: (context) => ProfileInfoCubit()..execute(),
        child: const PersonalInfoScreen(),
      );
  static Widget personalInfoEdit(ProfileInfoCubit cubit) => BlocProvider.value(
        value: cubit,
        child: const PersonalInfoEditScreen(),
      );
  static Widget get reservations => BlocProvider<ReservationsCubit>(
        create: (context) => ReservationsCubit()..onProgress(),
        child: const ReservationsScreen(),
      );

  static Widget get settings => const SettingsScreen();

  static Widget get contacts => BlocProvider<ContactsCubit>(
        create: (context) => ContactsCubit()..execute(),
        child: const ContactsScreen(),
      );
  static Widget get languages => BlocProvider<LanguagesCubit>(
        create: (context) => LanguagesCubit()..execute(),
        child: const LanguagesScreen(),
      );
  static Widget get evaluation => const EvaluationScreen();
  static Widget get myCars => BlocProvider(
      create: (context) => MyCarsCubit()
        ..getBanTypes()
        ..execute(),
      child: const MyCarsScreen());
  static Widget get splashBegin => const SplashBeginScreen();

  static Widget detialedOffer(Offer offer) => DetailedOfferScreen(
        offer: offer,
      );

  static Widget reservationDetail({
    bool isNew = false,
    required Branch branch,
    required Car car,
    required Service service,
    required DateTime date,
    required Time time,
    m.Active? reservation,
    Function? onSubmit,
  }) {
    return BlocProvider(
      create: (context) => ChangeStatusCubit(),
      child: ReservationDetailScreen(
        isNew: isNew,
        branch: branch,
        car: car,
        service: service,
        date: date,
        time: time,
        onSubmit: onSubmit,
        reservation: reservation,
      ),
    );
  }

  static Widget termsAndAgreement({required SignUpCubit signUpCubit}) =>
      BlocProvider<SignUpCubit>.value(
        value: signUpCubit,
        child: TermsAndAgreementScreen(),
      );
  static Widget splash({
    int? duration,
    required String svgAssets,
    required String headerText,
    required String subText,
    required Widget page,
  }) =>
      SplashScreen(
        svgAsset: svgAssets,
        headerText: headerText,
        subText: subText,
        page: page,
      );

  static Widget get faq => BlocProvider(
        create: (context) => FaqCubit()..execute(),
        child: const FAQScreen(),
      );

  Pager._();
}
