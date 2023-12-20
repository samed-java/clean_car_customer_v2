import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_checkbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginLowerPart extends StatelessWidget {
  LoginLowerPart({super.key});
  final TextEditingController _numberController = TextEditingController();
  final ValueNotifier<bool> _isCheckedRememberMe = ValueNotifier<bool>(false);

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
                "Telefon nömrəsi",
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
          ),
          Gaps.h10,
          Row(
            children: [
              Gaps.w4,
              CustomCheckbox(isCheckedNotifier: _isCheckedRememberMe),
              Gaps.w4,
              Text(
                "Məni yadda saxla",
                style: getRegularStyle(color: ColorManager.mainBlack),
              )
            ],
          ),
          Gaps.h32,
          CustomButton(
            frontText: "Daxil Ol",
            onPressed: () {
              Go.removeUntillAndGo(Pager.main);
            },
          ),
          Gaps.h16,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Hesabın yoxdur?',
                  style: getRegularStyle(
                      color: ColorManager.mainBlack, fontSize: 14),
                ),
                TextSpan(
                  text: ' Qeydiyyatdan keç',
                  style: getRegularStyle(
                      color: ColorManager.mainBlue, fontSize: 14),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Go.to(Pager.onboarding);
                      // Handle the "Xidmət Şərtlərimiz" link tap
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
