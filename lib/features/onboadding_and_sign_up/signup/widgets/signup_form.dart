import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_checkbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/components/terms_and_agreement.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/validators/is_email_valid.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignupFormWidget extends StatefulWidget {
  SignupFormWidget({
    super.key,
    required this.isChecked,
    this.emailText,
    this.nameText,
    this.numberText,
  });
  bool isChecked;
  String? emailText;
  String? nameText;
  String? numberText;

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  ValueNotifier<bool> _isCheckedRememberMe = ValueNotifier<bool>(false);
  @override
  void initState() {
    if (widget.nameText != null) {
      _nameController.text = widget.nameText!;
    }
    if (widget.emailText != null) {
      _emailController.text = widget.emailText!;
    }
    if (widget.numberText != null) {
      _numberController.text = widget.numberText!;
    }
    _isCheckedRememberMe = ValueNotifier<bool>(widget.isChecked);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your number';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              cursorColor: ColorManager.thirdBlack,
              controller: _numberController,
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
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              cursorColor: ColorManager.thirdBlack,
              controller: _nameController,
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
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!value.isEmailValid()) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              cursorColor: ColorManager.thirdBlack,
              controller: _emailController,
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
                            Go.to(TermsAndAgreementScreen(
                              nameText: _nameController.text,
                              emailText: _emailController.text,
                              numberText: _numberController.text,
                            ));
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
                      if (_formKey.currentState!.validate()) {
                        Go.to(Pager.otp);
                      }
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
