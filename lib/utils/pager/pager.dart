import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/branch_screen.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/branches_screen.dart';
import 'package:clean_car_customer_v2/features/home/home_screen.dart';
import 'package:clean_car_customer_v2/features/login/login_screen.dart';
import 'package:clean_car_customer_v2/features/main/main_screen.dart';
import 'package:clean_car_customer_v2/features/offers/detailed_offers/detailed_offer_screen.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/onboarding/onboarding.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/otp/otp_screen.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/components/terms_and_agreement.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/signup_screen.dart';
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
  static Widget get detialedOffer => const DetailedOfferScreen();

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
