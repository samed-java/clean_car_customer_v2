import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildOnboardingPage extends StatelessWidget {
  const BuildOnboardingPage({
    super.key,
    required this.headerText,
    required this.subText,
    required this.svgAsset,
  });
  final String svgAsset;
  final String headerText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgAsset,
          height: 320.h,
          width: 272.w,
        ),
        SizedBox(height: 48.h),
        Gaps.h10,
        Text(
          headerText,
          textAlign: TextAlign.center,
          style: getMediumStyle(color: ColorManager.mainBlack, fontSize: 24),
        ),
        Padding(
          padding: Paddings.horizontal32,
          child: Text(
            subText,
            textAlign: TextAlign.center,
            style: getRegularStyle(
                color: ColorManager.secondaryBlack, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
