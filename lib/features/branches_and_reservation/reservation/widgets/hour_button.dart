import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HourButton extends StatelessWidget {
  final String hour;
  final bool isSelected;
  final bool isDisabled;
  final Function() onPressed;

  const HourButton({
    Key? key,
    required this.hour,
    required this.isSelected,
    required this.isDisabled,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isDisabled
        ? Container(
            width: 72.w,
            // height: 28.h,
            decoration: BoxDecoration(
              color: ColorManager.mainWhite,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Text(
                  hour,
                  style: getRegularStyle(
                      color: ColorManager.fifthBlack, fontSize: 14),
                ),
              ),
            ),
          )
        : Bounce(
            onPressed: () {
              onPressed.call();
            },
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: 72.w,
              // height: 28.h,
              decoration: BoxDecoration(
                color:
                    isSelected ? ColorManager.mainBlue : ColorManager.mainWhite,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Text(
                    hour,
                    style: getRegularStyle(
                        color: isSelected
                            ? ColorManager.mainWhite
                            : ColorManager.mainBlack,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
          );
  }
}
