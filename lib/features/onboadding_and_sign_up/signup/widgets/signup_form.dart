import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_checkbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/components/terms_and_agreement.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/data/cubit/sign_up_cubit.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/validators/is_email_valid.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignupFormWidget extends StatefulWidget {
  SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  late final SignUpCubit cubit;
  @override
  void initState() {
    cubit = context.read<SignUpCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: Paddings.all16,
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Gaps.w4,
            //     Text(
            //       context.locale.phonenumber,
            //       style: getRegularStyle(
            //           color: ColorManager.thirdBlack, fontSize: 14),
            //       textAlign: TextAlign.left,
            //     ),
            //     Expanded(child: Gaps.empty)
            //   ],
            // ),
            // Gaps.h2,
            // TextFormField(
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter your number';
            //     }
            //     return null;
            //   },
            //   keyboardType: TextInputType.phone,
            //   cursorColor: ColorManager.thirdBlack,
            //   controller: cubit.numberController,
            //   onChanged: (value) {},
            //   decoration: InputDecoration(
            //     contentPadding: Paddings.all8,
            //     filled: true,
            //     fillColor: ColorManager.mainWhite,
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide.none,
            //       borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
            //     ),
            //   ),
            // ),
            //
            // Gaps.h10,

            //! Second Part
            Row(
              children: [
                Gaps.w4,
                Text(
                  context.locale.fullname,
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
              controller: cubit.nameController,
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
                  context.locale.email,
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
                if (value != null && value.isNotEmpty) {
                  if (!value.isEmailValid()) {
                    return "Please Enter Valid Email";
                  }
                }
                return null;
              },
              cursorColor: ColorManager.thirdBlack,
              controller: cubit.emailController,
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
                CustomCheckbox(isCheckedNotifier: cubit.isCheckedRememberMe),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: context.locale.termsandconditions,
                        style: getUnderlineStyle(
                            color: ColorManager.mainBlue, fontSize: 14),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await SystemChannels.textInput
                                .invokeMethod("TextInput.hide");
                            Go.to(Pager.termsAndAgreement(
                              signUpCubit: cubit,
                            ));
                          },
                      ),
                      TextSpan(
                        text: ' ${context.locale.agreewith}',
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
                valueListenable: cubit.isCheckedRememberMe,
                builder: (context, value, _) {
                  return CustomButton(
                    frontText: context.locale.continu,
                    onPressed: () {
                      cubit.signUp();
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
