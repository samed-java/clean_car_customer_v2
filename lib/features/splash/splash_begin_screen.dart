import 'dart:async';
import 'package:clean_car_customer_v2/constants/res/color_manager.dart';
import 'package:clean_car_customer_v2/features/splash/widgets/splash_begin_animated_icon.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/pager/transition.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class SplashBeginScreen extends StatefulWidget {
  const SplashBeginScreen({
    Key? key,
    // this.duration = 1000,
    // required this.page,
    // required this.headerText,
    // required this.subText,
    // required this.svgAsset,
  }) : super(key: key);
  // final int duration;
  // final String svgAsset;
  // final String headerText;
  // final String subText;
  // final Widget page;

  @override
  State<SplashBeginScreen> createState() => _SplashBeginScreenState();
}

class _SplashBeginScreenState extends State<SplashBeginScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 3000), () {
      PageTransitionUtils.navigateWithFadeOutTransition(
          context, Pager.onboarding);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBackgroundColor,
      body: const Stack(
        children: [
          SplashBeginAnimatedIcon(),
        ],
      ),
      //),
    );
  }
}
