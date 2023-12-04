import 'package:clean_car_customer_v2/components/custom_upper_part.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen(
      {super.key,
      this.isAgree = false,
      this.emailText,
      this.nameText,
      this.numberText});
  final bool isAgree;
  String? nameText;
  String? emailText;
  String? numberText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBackgroundColor,
      body: SafeArea(
        left: true,
        right: true,
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Gaps.h24,
                const CustomUpperPart(
                  headerText: "Qeydiyyatdan Keç!!!",
                  subText: "Sadəcə bir telefon nömrəsi ilə qeydiyyatdan keçin",
                ),
                Gaps.h24,
                SignupFormWidget(
                  isChecked: isAgree,
                  emailText: emailText,
                  nameText: nameText,
                  numberText: numberText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
