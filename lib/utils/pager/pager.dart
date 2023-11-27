import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/branch_screen.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/branches_screen.dart';
import 'package:clean_car_customer_v2/features/evaluation/evaluation_screen.dart';
import 'package:clean_car_customer_v2/features/home/home_screen.dart';
import 'package:clean_car_customer_v2/features/login/login_screen.dart';
import 'package:clean_car_customer_v2/features/main/main_screen.dart';
import 'package:clean_car_customer_v2/features/offers/detailed_offers/detailed_offer_screen.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/onboarding/onboarding.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/otp/otp_screen.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/components/terms_and_agreement.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/signup_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/my_cars_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/personal_info_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/profile/profile_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservation_details/reservation_detail_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/reservations_screen.dart';
import 'package:clean_car_customer_v2/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Pager {
  static Widget get onboarding => const OnboardingScreen();
  static Widget get login => const LoginScreen();
  static Widget get termsAndAgreement => TermsAndAgreementScreen();
  static Widget get otp => const OTPScreen();
  static Widget get main => const MainScreen();
  static Widget get signup => const SignupScreen();
  static Widget get home => const HomeScreen();
  static Widget get branches => const BranchesScreen();
  static Widget get branch => const BranchScreen();
  static Widget get profile => const ProfileScreen();
  static Widget get personalInfo => const PersonalInfoScreen();
  static Widget get reservations => const ReservationsScreen();
  static Widget get reservationDetail => const ReservationDetailScreen();
  static Widget get detialedOffer => const DetailedOfferScreen();
  static Widget get evaluation => const EvaluationScreen();
  static Widget get myCars => const MyCarsScreen();

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

  Pager._();
}
