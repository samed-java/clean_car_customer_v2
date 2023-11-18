import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarBox extends StatelessWidget {
  const StarBox({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42.w,
      height: 40.h,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: ColorManager.mainWhite,
        borderRadius: BorderRadius.all(RadiusManager.radiusCircular4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: getMediumStyle(color: ColorManager.mainBlack, fontSize: 14),
          ),
          Gaps.w2,
          SvgPicture.asset(IconAssets.star)
        ],
      ),
    );
  }
}
