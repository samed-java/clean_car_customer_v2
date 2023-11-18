import 'package:animate_do/animate_do.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashAnimatedIcon extends StatelessWidget {
  const SplashAnimatedIcon({
    super.key,
    required this.duration,
    required this.svgAssets,
    required this.headerText,
    required this.subText,
  });
  final int duration;
  final String svgAssets;
  final String headerText;
  final String subText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeIn(
        duration: Duration(milliseconds: duration),
        child: Center(
          child: Padding(
            padding: Paddings.horizontal64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageAssets.confirmed,
                  width: 128.w,
                  height: 128.h,
                ),
                Gaps.h24,
                Text(
                  headerText,
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                      color: ColorManager.mainWhite, fontSize: 24),
                ),
                Gaps.h8,
                Text(
                  subText,
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                      color: ColorManager.mainWhite, fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
