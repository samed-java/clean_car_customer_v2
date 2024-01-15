import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationDetailCard extends StatelessWidget {
  final String headerText;
  final Widget content;
  final Function()? onTap;
  const ReservationDetailCard({
    super.key,
    required this.content,
    required this.headerText,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.mainWhite,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 12.h,
            bottom: 16.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headerText,
                style: getMediumStyle(
                  color: ColorManager.mainBlue,
                  fontSize: 16,
                ),
              ),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
