// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:omid/bloc/bloc_exports.dart';
// import 'package:omid/presentation/authentication/helper%20widgets/otp/confirm_otp.dart';
// import 'package:omid/presentation/authentication/forget_pass.dart';
// import 'package:omid/presentation/authentication/login.dart';
// import 'package:omid/presentation/authentication/registert.dart';
// import 'package:omid/presentation/authentication/resend_pin.dart';
// import 'package:omid/presentation/home/bonus%20cart/bonus_cart_page.dart';
// import 'package:omid/presentation/bottom_bar/main_navigation_page.dart';
// import 'package:omid/presentation/campaign/campaign_detail.dart';
// import 'package:omid/presentation/profile/profile_setting.dart';
//
// import '../../domain/const_location_model.dart';
// import '../../domain/notification/notification_page_model.dart';
// import '../authentication/helper widgets/otp/verfy_phone_otp.dart';
// import '../home/transactions/transaction_detail.dart';
// import '../locations/locations_detail.dart';
// import '../onboarding/onboarding.dart';
// import '../profile/terms_privacy_page.dart';
// import '../splash/splash.dart';
//
// final goRouter = GoRouter(
//   initialLocation: '/',
//   debugLogDiagnostics: false,
//   routes: <RouteBase>[
//     GoRoute(
//         path: '/',
//         name: AppRoute.splash.name,
//         builder: (context, state) => const SplashView(),
//         routes: const []),
//     GoRoute(
//       path: '/onboard',
//       name: AppRoute.onboard.name,
//       pageBuilder: (context, state) {
//         return CustomTransitionPage(
//             child: const OnBoardingView(),
//             fullscreenDialog: true,
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return FadeTransition(
//                 opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
//                 child: child,
//               );
//             });
//       },
//     ),
//     GoRoute(
//         path: '/login',
//         name: AppRoute.login.name,
//         pageBuilder: (context, state) {
//           return CustomTransitionPage(
//               child: BlocProvider<AuthBloc>(
//                 create: (context) => AuthBloc(),
//                 child: const LoginPage(),
//               ),
//               fullscreenDialog: true,
//               transitionsBuilder:
//                   (context, animation, secondaryAnimation, child) {
//                 return FadeTransition(
//                   opacity: CurveTween(curve: Curves.easeIn).animate(animation),
//                   child: child,
//                 );
//               });
//         },
//         routes: [
//           GoRoute(
//             path: 'forget_pass',
//             name: AppRoute.forgetPass.name,
//             pageBuilder: (context, state) {
//               return CustomTransitionPage(
//                   child: BlocProvider(
//                     create: (context) => AuthBloc(),
//                     child: const ForgetPassPage(),
//                   ),
//                   fullscreenDialog: true,
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     return FadeTransition(
//                       opacity:
//                           CurveTween(curve: Curves.easeIn).animate(animation),
//                       child: child,
//                     );
//                   });
//             },
//           ),
//           GoRoute(
//             path: 'otp_confirm',
//             name: AppRoute.otp.name,
//             pageBuilder: (context, state) {
//               final String args = state.extra as String;
//               final String number = state.queryParameters['number'] as String;
//               return CustomTransitionPage(
//                 child: BlocProvider(
//                   create: (context) => AuthBloc(),
//                   child: OtpPage(
//                     id: args,
//                     phone: number,
//                   ),
//                 ),
//                 fullscreenDialog: true,
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   return FadeTransition(
//                     opacity:
//                         CurveTween(curve: Curves.easeIn).animate(animation),
//                     child: child,
//                   );
//                 },
//               );
//             },
//           ),
//           //VerifyOtpPage
//           GoRoute(
//             path: 'verify_phone',
//             name: AppRoute.verifyPhone.name,
//             pageBuilder: (context, state) {
//               final String args = state.extra as String;
//               final String number = state.queryParameters['number'] as String;
//
//               return CustomTransitionPage(
//                 child: BlocProvider(
//                   create: (context) => AuthBloc(),
//                   child: VerifyOtpPage(
//                     id: args,
//                     phone: number,
//                   ),
//                 ),
//                 fullscreenDialog: true,
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   return FadeTransition(
//                     opacity:
//                         CurveTween(curve: Curves.easeIn).animate(animation),
//                     child: child,
//                   );
//                 },
//               );
//             },
//           ),
//           GoRoute(
//             path: 'resend_pin',
//             name: AppRoute.resendPin.name,
//             pageBuilder: (context, state) {
//               final String args = state.extra as String;
//               return CustomTransitionPage(
//                 child: BlocProvider(
//                   create: (context) => AuthBloc(),
//                   child: ResendPin(
//                     id: args,
//                   ),
//                 ),
//                 fullscreenDialog: true,
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   return FadeTransition(
//                     opacity:
//                         CurveTween(curve: Curves.easeIn).animate(animation),
//                     child: child,
//                   );
//                 },
//               );
//             },
//           ),
//         ]),
//     GoRoute(
//       path: '/register',
//       name: AppRoute.register.name,
//       pageBuilder: (context, state) {
//         return CustomTransitionPage(
//             child: BlocProvider<AuthBloc>(
//                 create: (context) => AuthBloc(), child: const RegisterPage()),
//             fullscreenDialog: true,
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return FadeTransition(
//                 opacity: CurveTween(curve: Curves.easeIn).animate(animation),
//                 child: child,
//               );
//             });
//       },
//     ),
//     GoRoute(
//         path: '/main_navigation',
//         name: AppRoute.main.name,
//         pageBuilder: (context, state) {
//           return CustomTransitionPage(
//               child: BlocProvider<NavigationCubit>(
//                 create: (context) => NavigationCubit(),
//                 child: const MainNavigationPage(),
//               ),
//               fullscreenDialog: true,
//               transitionsBuilder:
//                   (context, animation, secondaryAnimation, child) {
//                 return FadeTransition(
//                   opacity: CurveTween(curve: Curves.easeIn).animate(animation),
//                   child: child,
//                 );
//               });
//         },
//         routes: [
//           GoRoute(
//             path: 'bonus_cart',
//             name: AppRoute.bonusCart.name,
//             pageBuilder: (context, state) {
//               final args = state.queryParameters['data'];
//               return CustomTransitionPage(
//                 child: BonusCart(
//                   data: args!,
//                 ),
//                 fullscreenDialog: true,
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   const begin = Offset(1.0, 0.0);
//                   const end = Offset.zero;
//                   final tween = Tween(begin: begin, end: end);
//                   final offsetAnimation = animation.drive(tween);
//                   return SlideTransition(
//                     position: offsetAnimation,
//                     child: child,
//                   );
//                 },
//               );
//             },
//           ),
//           GoRoute(
//             path: 'profile_setting',
//             name: AppRoute.profileSetting.name,
//             pageBuilder: (context, state) {
//               return CustomTransitionPage(
//                   child: BlocProvider(
//                     create: (context) => ProfileBloc()..add(GetProfileData()),
//                     child: const ProfileSetting(),
//                   ),
//                   fullscreenDialog: true,
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     return FadeTransition(
//                       opacity:
//                           CurveTween(curve: Curves.easeIn).animate(animation),
//                       child: child,
//                     );
//                   });
//             },
//           ),
//           GoRoute(
//             path: 'locations_detail',
//             name: AppRoute.locationDetail.name,
//             pageBuilder: (context, state) {
//               ConstantLocationModel args = state.extra as ConstantLocationModel;
//
//               return CustomTransitionPage(
//                   child: GoogleMapsIframe(
//                     model: args,
//                   ),
//                   // child: BlocProvider(
//                   //   create: (context) => ProfileBloc()..add(GetProfileData()),
//                   //   child: const ProfileSetting(),
//                   // ),
//                   fullscreenDialog: true,
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     return FadeTransition(
//                       opacity:
//                           CurveTween(curve: Curves.easeIn).animate(animation),
//                       child: child,
//                     );
//                   });
//             },
//           ),
//           GoRoute(
//             path: 'campaign_detail',
//             name: AppRoute.campaignDetail.name,
//             pageBuilder: (context, state) {
//               final url = state.extra as String;
//               final title = state.queryParameters['title'] as String;
//               return CustomTransitionPage(
//                   child: CampaignDetail(
//                     url: url,
//                     title: title,
//                   ),
//                   fullscreenDialog: true,
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     return FadeTransition(
//                       opacity:
//                           CurveTween(curve: Curves.easeIn).animate(animation),
//                       child: child,
//                     );
//                   });
//             },
//           ),
//           GoRoute(
//             path: 'transaction_detail',
//             name: AppRoute.transactions.name,
//             pageBuilder: (context, state) {
//               final String cardNo = state.extra as String;
//               return CustomTransitionPage(
//                   child: TransactionDetail(
//                     cardNo: cardNo,
//                   ),
//                   fullscreenDialog: true,
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     return FadeTransition(
//                       opacity:
//                           CurveTween(curve: Curves.easeIn).animate(animation),
//                       child: child,
//                     );
//                   });
//             },
//           ),
//           GoRoute(
//             path: 'terms_privacy',
//             name: AppRoute.termsPrivacy.name,
//             pageBuilder: (context, state) {
//               return CustomTransitionPage(
//                   child: const PrivacyPolicyPage(),
//                   fullscreenDialog: true,
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     return FadeTransition(
//                       opacity:
//                           CurveTween(curve: Curves.easeIn).animate(animation),
//                       child: child,
//                     );
//                   });
//             },
//           ),
//           GoRoute(
//             path: 'notification_detail',
//             name: AppRoute.notfPage.name,
//             pageBuilder: (context, state) {
//               final notfModel = state.extra as NotfPageModel;
//               return CustomTransitionPage(
//                   child: NotficationDetail(
//                     model: notfModel,
//                   ),
//                   fullscreenDialog: true,
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     return FadeTransition(
//                       opacity:
//                           CurveTween(curve: Curves.easeIn).animate(animation),
//                       child: child,
//                     );
//                   });
//             },
//           ),
//         ]),
//   ],
// //  errorBuilder: (context, state) => const NotFoundScreen(),
// );
//
// enum AppRoute {
//   verifyPhone,
//   splash,
//   onboard,
//   login,
//   register,
//   forgetPass,
//   home,
//   otp,
//   main,
//   bonusCart,
//   transactions,
//   profileSetting,
//   locationDetail,
//   campaignDetail,
//   termsPrivacy,
//   notfPage,
//   resendPin
// }
