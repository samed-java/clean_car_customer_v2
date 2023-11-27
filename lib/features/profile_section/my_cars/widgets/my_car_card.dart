import 'package:clean_car_customer_v2/components/padded_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/enum/car_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCarCard extends StatelessWidget {
  final CarTypes carTypes;
  final String name;
  final String number;

  const MyCarCard(
      {super.key,
      required this.carTypes,
      required this.name,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.mainWhite,
          borderRadius: BorderRadius.circular(6.r)),
      child: Padding(
        padding:
            EdgeInsets.only(top: 12.h, bottom: 12.h, left: 16.w, right: 16.w),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorManager.mainBackgroundColor,
              radius: 24.r,
              child: carTypes == CarTypes.sedan
                  ? SvgPicture.asset(ImageAssets.sedan)
                  : SvgPicture.asset(ImageAssets.jeep),
            ),
            Gaps.w12,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: getMediumStyle(
                      color: ColorManager.mainBlack, fontSize: 14),
                ),
                Text(
                  number,
                  style: getMediumStyle(
                      color: ColorManager.mainBlack, fontSize: 12),
                ),
              ],
            ),
            Expanded(child: Gaps.empty),
            PaddedButton(frontText: "Ətraflı", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
