import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_upper_part.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/otp/data/cubit/otp_cubit.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/otp/widgets/count_down_timer.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/pager/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/pager/go.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OTPCubit cubit = context.read<OTPCubit>();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // SizedBox(
            //   height: topSafeArea,
            // ),
            Gaps.h24,
            CustomUpperPart(
              headerText: "${context.locale.otpauthentication}!!!",
              subText: context.locale.signupthirdtext,
            ),
            Gaps.h32,
            Padding(
              padding: Paddings.horizontal16,
              child: Pinput(
                controller: cubit.otpController,
                keyboardType: TextInputType.number,
                onCompleted: (value) {
                  cubit.verify();
                },
                defaultPinTheme: PinTheme(
                  width: 200.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: ColorManager.mainWhite,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.locale.signupfourthtext,
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
              child: BlocListener<OTPCubit, OTPState>(
                listener: (context, state) {
                  if (state is OTPRegistered) {
                    PageTransitionUtils.navigateWithFadeInTransition(
                        context,
                        Pager.splash(
                            svgAssets: ImageAssets.confirmed,
                            headerText: "${context.locale.confirmed}!!!",
                            subText:
                                context.locale.signupsixthtext,
                            page: Pager.main));
                  }
                  else if(state is OTPNotRegistered){
                    Go.to(Pager.onboarding);
                  }
                },
                child: CustomButton(
                  frontText: context.locale.confirm,
                  onPressed: () {
                    // PageTransitionUtils.navigateWithFadeInTransition(
                    //     context,
                    //     Pager.splash(
                    //         svgAssets: ImageAssets.confirmed,
                    //         headerText: "Təsdiqləndi!!!",
                    //         subText:
                    //             "Mobil tətbiqdəki qeydiyyatınız uğurla təsdiqləndi",
                    //         page: Pager.main));

                    cubit.verify();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
