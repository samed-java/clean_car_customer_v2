import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_checkbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/login/cubit/login_cubit.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginLowerPart extends StatelessWidget {
  LoginLowerPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.all16,
      child: Column(
        children: [
          Row(
            children: [
              Gaps.w4,
              Text(
                context.locale.phonenumber,
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
              keyboardType: TextInputType.number,
              cursorColor: ColorManager.thirdBlack,
              controller: context.read<LoginCubit>().phoneController,
              onChanged: (value) {},
              inputFormatters: [
                MaskTextInputFormatter(mask: "994 ## ### ## ##")
              ],
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
          ),
          Gaps.h10,
          Row(
            children: [
              Gaps.w4,
              CustomCheckbox(
                  isCheckedNotifier:
                      context.read<LoginCubit>().isCheckedRememberMe),
              Gaps.w4,
              Text(
                context.locale.rememberme,
                style: getRegularStyle(color: ColorManager.mainBlack),
              )
            ],
          ),
          Gaps.h32,
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Go.to(Pager.otp);
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return Container(
                  height: 44.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.mainBlue),
                    color: ColorManager.mainBlue,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: const Center(
                    child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        )),
                  ),
                );
              } else if (state is LoginInitial) {
                return CustomButton(
                  frontText: context.locale.enter,
                  onPressed: () {
                    context.read<LoginCubit>().execute();
                  },
                );
              } else if (state is LoginFail) {
                return CustomButton(
                  frontText: context.locale.enter,
                  onPressed: () {
                    context.read<LoginCubit>().execute();
                  },
                );
              }
              return CustomButton(
                frontText: context.locale.enter,
                onPressed: () {
                  context.read<LoginCubit>().execute();
                },
              );
            },
          ),
          Gaps.h16,
        ],
      ),
    );
  }
}
