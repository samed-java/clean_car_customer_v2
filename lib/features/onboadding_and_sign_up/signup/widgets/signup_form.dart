import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_checkbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SignupFormWidget extends StatefulWidget {
  SignupFormWidget({
    super.key,
    required this.isChecked,
  });
  bool isChecked;
  String? _errorText;

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  ValueNotifier<bool> _isCheckedRememberMe = ValueNotifier<bool>(false);
  @override
  void initState() {
    _isCheckedRememberMe = ValueNotifier<bool>(widget.isChecked);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: Paddings.all16,
        child: Column(
          children: [
            Row(
              children: [
                Gaps.w4,
                Text(
                  "Telefon nömrəsi",
                  style: getRegularStyle(
                      color: ColorManager.thirdBlack, fontSize: 14),
                  textAlign: TextAlign.left,
                ),
                Expanded(child: Gaps.empty)
              ],
            ),
            Gaps.h2,
            Container(
              height: 40.h,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.fifthBlack,
                    spreadRadius: -3,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                cursorColor: ColorManager.thirdBlack,
                controller: _numberController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  errorText: widget._errorText,
                  contentPadding: Paddings.all8,
                  filled: true,
                  fillColor: ColorManager.mainWhite,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(RadiusManager.radiusCircular6),
                  ),
                ),
              ),
            ),
            Gaps.h10,

            //! Second Part
            Row(
              children: [
                Gaps.w4,
                Text(
                  "Tam ad",
                  style: getRegularStyle(
                      color: ColorManager.thirdBlack, fontSize: 14),
                  textAlign: TextAlign.left,
                ),
                Expanded(child: Gaps.empty)
              ],
            ),
            Gaps.h2,
            Container(
              height: 40.h,
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.fifthBlack,
                    spreadRadius: -3,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                cursorColor: ColorManager.thirdBlack,
                controller: _nameController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: Paddings.all8,
                  filled: true,
                  fillColor: ColorManager.mainWhite,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(RadiusManager.radiusCircular6),
                  ),
                ),
              ),
            ),
            Gaps.h10,
            //! Third Part

            Row(
              children: [
                Gaps.w4,
                Text(
                  "E-mail",
                  style: getRegularStyle(
                      color: ColorManager.thirdBlack, fontSize: 14),
                  textAlign: TextAlign.left,
                ),
                Expanded(child: Gaps.empty)
              ],
            ),
            Gaps.h2,
            Container(
              height: 40.h,
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.fifthBlack,
                    spreadRadius: -3,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                cursorColor: ColorManager.thirdBlack,
                controller: _emailController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: Paddings.all8,
                  filled: true,
                  fillColor: ColorManager.mainWhite,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(RadiusManager.radiusCircular6),
                  ),
                ),
              ),
            ),
            Gaps.h10,
            Row(
              children: [
                Gaps.w4,
                CustomCheckbox(isCheckedNotifier: _isCheckedRememberMe),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Şərtlər və qaydalar',
                        style: getUnderlineStyle(
                            color: ColorManager.mainBlue, fontSize: 14),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Go.to(Pager.termsAndAgreement);
                          },
                      ),
                      TextSpan(
                        text: ' ilə razıyam',
                        style: getRegularStyle(
                            color: ColorManager.mainBlack, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Gaps.empty,
                )
              ],
            ),
            Gaps.h32,
            ValueListenableBuilder<bool>(
                valueListenable: _isCheckedRememberMe,
                builder: (context, value, _) {
                  return CustomButton(
                    frontText: "Davam Et",
                    onPressed: () {
                      Go.to(Pager.otp);
                    },
                    isDisable: value ? false : true,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
