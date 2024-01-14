import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_checkbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/data/cubit/sign_up_cubit.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/signup_screen.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TermsAndAgreementScreen extends StatelessWidget {
  TermsAndAgreementScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        bottom: false,
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
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
                      context.locale.termsandconditions,
                      style: getMediumStyle(
                          color: ColorManager.mainBlack, fontSize: 24),
                    ),
                    Gaps.h16,
                    SizedBox(
                      height: 330.h,
                      child: Padding(
                        padding: Paddings.horizontal32,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (cubit.terms?.terms ?? [])
                                        .elementAt(index)
                                        .title,
                                    style: getBoldStyle(
                                        color: ColorManager.secondaryBlack,
                                        fontSize: 14),
                                  ),
                                  Gaps.h16,
                                  Text(
                                    (cubit.terms?.terms ?? [])
                                        .elementAt(index)
                                        .content,
                                    style: getRegularStyle(
                                        color: ColorManager.secondaryBlack,
                                        fontSize: 14),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (_, __) => 16.verticalSpace,
                            itemCount: (cubit.terms?.terms ?? []).length),
                      ),
                    ),
                    Gaps.h10,
                    Padding(
                      padding: Paddings.horizontal32,
                      child: Row(
                        children: [
                          CustomCheckbox(
                              isCheckedNotifier: cubit.isCheckedRememberMe),
                          Gaps.w4,
                          Text(
                            context.currentLocale != "az"
                                ? "${context.locale.agreewith} ${context.locale.termsandconditions}"
                                : "${context.locale.termsandconditions} ${context.locale.agreewith}",
                            style: getRegularStyle(
                                color: ColorManager.mainBlack, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Padding(
                  padding: Paddings.horizontal24,
                  child: ValueListenableBuilder<bool>(
                    valueListenable:
                        context.read<SignUpCubit>().isCheckedRememberMe,
                    builder: (context, value, _) {
                      return value
                          ? CustomButton(
                              frontText: context.locale.continu,
                              onPressed: () {
                                Go.back();
                              },
                            )
                          : CustomButton(
                              frontText: context.locale.continu,
                              onPressed: () {
                                Go.back();
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
