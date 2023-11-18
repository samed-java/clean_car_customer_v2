import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDots extends StatelessWidget {
  final int currentPage;

  const CustomDots({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Dot(index: index, currentPage: currentPage),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final int index;
  final int currentPage;

  const Dot({super.key, required this.index, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == currentPage;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      width: isSelected ? 12.w : 4.w,
      height: 4.h,
      decoration: BoxDecoration(
        shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isSelected ? BorderRadius.circular(4.r) : null,
        color: isSelected ? ColorManager.mainBlue : ColorManager.secondaryBlue,
      ),
    );
  }
}
