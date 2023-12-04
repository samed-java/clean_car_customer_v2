import 'package:clean_car_customer_v2/components/custom_text_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.buttonText,
    required this.headerText,
    required this.textStyle,
    required this.onPressed,
  });
  final String buttonText;
  final String headerText;
  final TextStyle textStyle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerText,
          style: getMediumStyle(color: ColorManager.mainBlack, fontSize: 18),
        ),
        CustomTextButton(
          text: buttonText,
          color: ColorManager.mainBlue,
          textStyle: textStyle,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
