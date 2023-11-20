import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  late Color? backgroundColor;
  late Color? foregroundColor;
  late Color? disableColor;
  late Color? borderColor;
  late double? radius;
  late double? height;
  late double? width;
  final String frontText;
  late Function? onPressed;
  late int? time;
  late bool? isDisable;

  CustomButton(
      {Key? key,
      required this.frontText,
      this.backgroundColor,
      this.height,
      this.width,
      this.foregroundColor,
      this.borderColor,
      required this.onPressed,
      this.radius,
      this.isDisable,
      this.disableColor,
      this.time})
      : super(key: key) {
    backgroundColor ??= ColorManager.mainBlue;
    height ??= 44.h;
    width ??= 336.w;
    foregroundColor ??= ColorManager.mainWhite;
    radius ??= 6.r;
    time ??= 100;
    isDisable ??= false;
    disableColor ??= ColorManager.secondaryBlue;
    borderColor ??= ColorManager.mainBlue;
  }

  @override
  Widget build(BuildContext context) {
    return isDisable!
        ? SizedBox(
            height: height,
            width: width,
            child: Container(
              decoration: BoxDecoration(
                color: disableColor,
                borderRadius: BorderRadius.circular(radius!),
              ),
              child: Center(
                child: Text(frontText,
                    style: getButtonStyle(color: foregroundColor!)),
              ),
            ),
          )
        : Bounce(
            onPressed: () {
              onPressed?.call();
            },
            duration: Duration(milliseconds: time!),
            child: SizedBox(
              height: height,
              width: width,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor!),
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(radius!),
                ),
                child: Center(
                  child: Text(frontText,
                      style: getButtonStyle(color: foregroundColor!)),
                ),
              ),
            ),
          );
  }
}
