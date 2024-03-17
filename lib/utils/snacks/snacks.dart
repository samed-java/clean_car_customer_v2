
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/res/color_manager.dart';
import '../../constants/res/gaps.dart';
import '../../constants/res/paddings.dart';
import '../../constants/res/radius_manager.dart';
import '../../constants/res/styles_manager.dart';
import '../../constants/res/values_manager.dart';
import '../services/navigation_service/navigation_service.dart';


class Snacks {
  Snacks._();

  static void showCustomSnack({required String message, bool isSucces = true}) {
    ScaffoldMessenger.of(NavigationService.instance.context)
        .showSnackBar(SnackBar(
      content: SizedBox(
        height: 32.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.info,
              color: ColorManager.mainWhite,
              size: 16.sp,
            ),
            Gaps.w8,
            Text(
              message,
              style: getRegularStyle(color: ColorManager.mainWhite),
            )
          ],
        ),
      ),
      margin: Paddings.all32,
      // width: 331.w,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(RadiusManager.radiusCircular8)),
      duration: DurationConstant.s3,
      behavior: SnackBarBehavior.floating,
      backgroundColor: isSucces ? ColorManager.mainBlue : ColorManager.mainRed,
    ));
  }
}
