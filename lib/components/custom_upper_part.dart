import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomUpperPart extends StatelessWidget {
  const CustomUpperPart({
    super.key,
    required this.headerText,
    required this.subText,
    // required this.svgAsset,
  });
  // final String svgAsset;
  final String headerText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          ImageAssets.logo,
          // height: 72.h,
          // width: 72.w,
        ),
        Gaps.h10,
        Text(
          headerText,
          textAlign: TextAlign.center,
          style: getMediumStyle(color: ColorManager.mainBlack, fontSize: 24),
        ),
        Gaps.h8,
        Padding(
          padding: Paddings.horizontal64,
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
