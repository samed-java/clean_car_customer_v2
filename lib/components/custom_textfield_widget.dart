import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.headerText,
      this.controller,
      this.validator,
      this.inputFormatters,
        this.capitalize = false,
      this.hintText});
  final String headerText;
  final String? hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool capitalize;

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
          //height: 40.h,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: ColorManager.thirdBlack,
            onChanged: (value) {},
            controller: controller,
            validator: validator,
            inputFormatters: inputFormatters,
            textCapitalization:capitalize? TextCapitalization.characters:TextCapitalization.none,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
              ),
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
