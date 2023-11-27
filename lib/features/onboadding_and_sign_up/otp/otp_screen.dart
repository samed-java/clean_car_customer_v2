import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_upper_part.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/otp/widgets/count_down_timer.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/pager/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gaps.h24,
            const CustomUpperPart(
              headerText: "OTP Autentifikasiyası!!!",
              subText: "Telefon nömrənizə göndərilmiş kodu daxil edin",
            ),
            Gaps.h32,
            Padding(
              padding: Paddings.horizontal16,
              child: Pinput(
                keyboardType: TextInputType.number,
                onCompleted: (value) {
                  PageTransitionUtils.navigateWithFadeInTransition(
                      context,
                      Pager.splash(
                          svgAssets: ImageAssets.confirmed,
                          headerText: "Təsdiqləndi!!!",
                          subText:
                              "Mobil tətbiqdəki qeydiyyatınız uğurla təsdiqləndi",
                          page: Pager.login));
                },
                defaultPinTheme: PinTheme(
                  width: 200.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(RadiusManager.radiusCircular6),
                    color: ColorManager.mainWhite,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Kod gəlmədi?",
                  style: getRegularStyle(
                      color: ColorManager.mainBlack, fontSize: 14),
                ),
                const CountDownTimer(
                  second: 60,
                ),
              ],
            ),
            Gaps.h24,
            Padding(
              padding: Paddings.horizontal16,
              child: CustomButton(
                frontText: "Təsdiqlə",
                onPressed: () {
                  PageTransitionUtils.navigateWithFadeInTransition(
                      context,
                      Pager.splash(
                          svgAssets: ImageAssets.confirmed,
                          headerText: "Təsdiqləndi!!!",
                          subText:
                              "Mobil tətbiqdəki qeydiyyatınız uğurla təsdiqləndi",
                          page: Pager.main));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
