import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 50),
      onPressed: () {
        // Call the onPressed callback when the button is pressed
        onPressed();
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: ColorManager.mainBlue,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Image.asset(IconAssets.filter2),
      ),
    );
  }
}
