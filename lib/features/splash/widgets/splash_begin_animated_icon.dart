import 'package:animate_do/animate_do.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashBeginAnimatedIcon extends StatelessWidget {
  const SplashBeginAnimatedIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeIn(
        duration: const Duration(milliseconds: 1000),
        child: Center(
          child: Padding(
            padding: Paddings.horizontal64,
            child: SvgPicture.asset(
              ImageAssets.logo,
              width: 150.w,
              height: 150.h,
            ),
          ),
        ),
      ),
    );
  }
}
