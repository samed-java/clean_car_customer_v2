import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomDots extends StatelessWidget {
  final int currentPage;
  Color? onColor;
  Color? offColor;
  int number;

  CustomDots(
      {Key? key,
      required this.currentPage,
      required this.number,
      this.offColor,
      this.onColor})
      : super(key: key) {
    onColor ??= ColorManager.mainBlue;
    offColor ??= ColorManager.secondaryBlue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        number,
        (index) => Dot(
          index: index,
          currentPage: currentPage,
          onColor: onColor,
          offColor: offColor,
          number: number,
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final int index;
  final int currentPage;
  final Color? onColor;
  final Color? offColor;
  final int? number;

  const Dot({
    super.key,
    required this.index,
    required this.currentPage,
    required this.number,
    required this.offColor,
    required this.onColor,
  });

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
        color: isSelected ? onColor : offColor,
      ),
    );
  }
}
