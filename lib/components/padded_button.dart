import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class PaddedButton extends StatelessWidget {
  late Color? backgroundColor;
  late Color? foregroundColor;
  late Color? disableColor;
  late Color? borderColor;
  late double? radius;
  late double? horizontalPadding;
  late double? verticalPadding;

  final String frontText;
  late Function? onPressed;
  late int? time;
  late bool? isDisable;

  PaddedButton(
      {Key? key,
      required this.frontText,
      this.backgroundColor,
      this.foregroundColor,
      this.borderColor,
      required this.onPressed,
      this.radius,
      this.horizontalPadding,
      this.verticalPadding,
      this.isDisable,
      this.disableColor,
      this.time})
      : super(key: key) {
    backgroundColor ??= ColorManager.mainBlue;
    foregroundColor ??= ColorManager.mainWhite;
    horizontalPadding ??= 8;
    verticalPadding ??= 4;
    radius ??= 6.r;
    time ??= 100;
    isDisable ??= false;
    disableColor ??= ColorManager.secondaryBlue;
    borderColor ??= ColorManager.mainBlue;
  }

  @override
  Widget build(BuildContext context) {
    return isDisable!
        ? Container(
            decoration: BoxDecoration(
              color: disableColor,
              borderRadius: BorderRadius.circular(radius!),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: verticalPadding!,
                    bottom: verticalPadding!,
                    left: horizontalPadding!,
                    right: horizontalPadding!),
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
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: borderColor!),
                color: backgroundColor,
                borderRadius: BorderRadius.circular(radius!),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: verticalPadding!,
                      bottom: verticalPadding!,
                      left: horizontalPadding!,
                      right: horizontalPadding!),
                  child: Text(frontText,
                      style: getSemiBoldStyle(
                          color: foregroundColor!, fontSize: 12)),
                ),
              ),
            ),
          );
  }
}
