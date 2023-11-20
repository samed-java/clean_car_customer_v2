import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_checkbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/signup_screen.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TermsAndAgreementScreen extends StatelessWidget {
  TermsAndAgreementScreen({super.key});
  final ValueNotifier<bool> _isChecked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Gaps.h32,
              SvgPicture.asset(
                ImageAssets.termsAndAgreementLogo,
                height: 128.h,
                width: 128.w,
              ),
              Column(
                children: [
                  Text(
                    "Şərtlər və qaydalar",
                    style: getMediumStyle(
                        color: ColorManager.mainBlack, fontSize: 24),
                  ),
                  Gaps.h16,
                  SizedBox(
                    height: 330.h,
                    child: Padding(
                      padding: Paddings.horizontal32,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. ",
                              style: getRegularStyle(
                                  color: ColorManager.secondaryBlack,
                                  fontSize: 14),
                            ),
                            Gaps.h16,
                            Text(
                              "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).. ",
                              style: getRegularStyle(
                                  color: ColorManager.secondaryBlack,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Padding(
                    padding: Paddings.horizontal32,
                    child: Row(
                      children: [
                        CustomCheckbox(isCheckedNotifier: _isChecked),
                        Text(
                          "Şərtlər və qaydalar ilə razıyam",
                          style: getRegularStyle(
                              color: ColorManager.mainBlack, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _isChecked,
                builder: (context, value, _) {
                  return value
                      ? CustomButton(
                          frontText: "Davam Et",
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const SignupScreen(
                                          isAgree: true,
                                        )),
                                (route) => false);
                          },
                        )
                      : CustomButton(
                          frontText: "Geri Dön",
                          onPressed: () {
                            Go.back();
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
