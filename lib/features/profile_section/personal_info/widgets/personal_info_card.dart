import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfoCard extends StatelessWidget {
  final String headerText;
  final String subText;
  const PersonalInfoCard(
      {super.key, required this.headerText, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorManager.mainWhite,
            borderRadius: BorderRadius.circular(6.r)),
        child: Padding(
          padding:
              EdgeInsets.only(top: 12.h, bottom: 16.h, left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    headerText,
                    style: getMediumStyle(
                        color: ColorManager.mainBlue, fontSize: 16),
                  ),
                  Bounce(
                    onPressed: () {},
                    duration: const Duration(milliseconds: 100),
                    child: SizedBox(
                      height: 16.h,
                      width: 16.w,
                      child: SvgPicture.asset(IconAssets.pencil),
                    ),
                  ),
                ],
              ),
              Text(
                subText,
                style: getMediumStyle(
                    color: ColorManager.secondaryBlack, fontSize: 14),
              ),
            ],
          ),
        ));
  }
}
