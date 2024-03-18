import 'dart:async';
import 'package:clean_car_customer_v2/constants/res/color_manager.dart';
import 'package:clean_car_customer_v2/features/splash/widgets/splash_animated_icon.dart';
import 'package:clean_car_customer_v2/utils/pager/transition.dart';
import 'package:flutter/material.dart';

import '../../utils/pager/go.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
    this.duration = 1000,
    required this.page,
    required this.headerText,
    required this.subText,
    required this.svgAsset,
    this.backCount, this.backgroundColor,
  }) : super(key: key);
  final int duration;
  final String svgAsset;
  final String headerText;
  final String subText;
  final Widget? page;
  final int? backCount;
  final Color? backgroundColor;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(milliseconds: widget.duration + 1000), () {
      if (widget.page != null) {
        PageTransitionUtils.navigateWithFadeOutTransition(
            context, widget.page!);
      } else {
        for(int i = 0;i<(widget.backCount??1);i++){
          Go.back();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:widget.backgroundColor?? ColorManager.mainBlue,
      body: Stack(
        children: [
          SplashAnimatedIcon(
            duration: widget.duration,
            svgAssets: widget.svgAsset,
            headerText: widget.headerText,
            subText: widget.subText,
          ),
        ],
      ),
      //),
    );
  }
}
