import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_dropdown_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/components/custom_textfield_widget.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void carInfoDialog(BuildContext context, {isNew = false}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorManager.mainBackgroundColor,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
        content: Container(
          width: 320.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Avtomobil məlumatları",
                      style: getSemiBoldStyle(
                        color: ColorManager.mainBlue,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Go.back();
                      },
                      child: SizedBox(
                        child: Padding(
                          padding: Paddings.all6,
                          child: SvgPicture.asset(
                            IconAssets.exit,
                            height: 16.h,
                            width: 16.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gaps.h10,
                Text(
                  "Avtomobil növü",
                  style: getRegularStyle(
                    color: ColorManager.thirdBlack,
                    fontSize: 14,
                  ),
                ),

                Gaps.h2,
                const CustomDropDownButton(defaultValue: "Avtomobil növü seç"),
                // TextFormField(
                //   readOnly: true,
                //   cursorColor: ColorManager.thirdBlack,
                //   onChanged: (value) {},
                //   decoration: InputDecoration(
                //     suffixIcon: Image.asset(IconAssets.arrowDown),
                //     contentPadding: Paddings.all8,
                //     filled: true,
                //     fillColor: ColorManager.mainWhite,
                //     border: OutlineInputBorder(
                //       borderSide: BorderSide.none,
                //       borderRadius:
                //           BorderRadius.all(RadiusManager.radiusCircular6),
                //     ),
                //   ),
                // ),
                Gaps.h16,
                const TextFieldWidget(headerText: "Ad"),
                Gaps.h16,
                const TextFieldWidget(headerText: "Nömrə"),
                Gaps.h16,
                isNew
                    ? Gaps.empty
                    : CustomButton(
                        frontText: "Sil",
                        onPressed: () {},
                        borderColor: ColorManager.mainRed,
                        foregroundColor: ColorManager.mainRed,
                        backgroundColor: ColorManager.mainBackgroundColor,
                      ),
                Gaps.h10,
                CustomButton(frontText: "Yadda Saxla", onPressed: () {})
              ],
            ),
          ),
        ),
      );
    },
  );
}
