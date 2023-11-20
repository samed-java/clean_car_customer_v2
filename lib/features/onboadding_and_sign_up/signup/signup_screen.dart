import 'package:clean_car_customer_v2/components/custom_upper_part.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key, this.isAgree = false});
  final bool isAgree;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBackgroundColor,
      body: SafeArea(
        top: true,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
