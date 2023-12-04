import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.headerText});
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: getRegularStyle(
            color: ColorManager.thirdBlack,
            fontSize: 14,
          ),
        ),
        Gaps.h2,
        SizedBox(
          height: 40.h,
          child: TextFormField(
            cursorColor: ColorManager.thirdBlack,
            onChanged: (value) {},
            decoration: InputDecoration(
              contentPadding: Paddings.all8,
              filled: true,
              fillColor: ColorManager.mainWhite,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
              ),
            ),
          ),
        )
      ],
    );
  }
}
