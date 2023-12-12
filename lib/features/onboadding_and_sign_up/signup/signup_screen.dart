import 'package:clean_car_customer_v2/components/custom_upper_part.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/pager/go.dart';
import '../../../utils/pager/pager.dart';
import 'data/cubit/sign_up_cubit.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

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
                BlocListener<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if(state is SignUpRegistered || state is SignUpNotRegistered){
                      Go.to(Pager.otp);
                    }
                  },
                  child: SignupFormWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
