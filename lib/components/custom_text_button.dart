import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.text,
    required this.color,
    this.milliSeconds,
    this.onPressed,
    this.textStyle,
  }) : super(key: key) {
    textStyle ??= getButtonStyle(color: color);
    milliSeconds ??= 80;
  }
  final String text;
  final Color color;
  double? fontSize;
  int? milliSeconds;
  Function? onPressed;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onPressed: () {
        onPressed?.call();
      },
      duration: Duration(milliseconds: milliSeconds!),
      child: Text(text, style: textStyle),
    );
  }
}
