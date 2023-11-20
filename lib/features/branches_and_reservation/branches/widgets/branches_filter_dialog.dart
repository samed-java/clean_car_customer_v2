import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
// import 'package:clean_car_customer_v2/features/home/widgets/star_box.dart';
import 'package:clean_car_customer_v2/features/home/widgets/textfield_widget.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void openBranchesFilterBox(BuildContext context, double height) {
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
          // height: height,
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
                      "Filterlə",
                      style: getSemiBoldStyle(
                        color: ColorManager.mainBlue,
                        fontSize: 18,
                      ),
                    ),
                    Bounce(
                      duration: const Duration(milliseconds: 50),
                      onPressed: () {
                        Go.back();
                      },
                      child: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: SvgPicture.asset(
                          IconAssets.exit,
                        ),
                      ),
                    )
                  ],
                ),
                Gaps.h10,
                const TextFieldWidget(headerText: "Şəhər"),
                Gaps.h16,
                const TextFieldWidget(headerText: "Bölgə"),
                Gaps.h16,
                const TextFieldWidget(headerText: "Qəsəbə"),
                Gaps.h16,
                Text(
                  "Xidmət növü",
                  style: getRegularStyle(
                    color: ColorManager.thirdBlack,
                    fontSize: 14,
                  ),
                ),
                Gaps.h2,
                TextFormField(
                  readOnly: true,
                  cursorColor: ColorManager.thirdBlack,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    suffixIcon: Image.asset(IconAssets.arrowDown),
                    contentPadding: Paddings.all8,
                    filled: true,
                    fillColor: ColorManager.mainWhite,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.all(RadiusManager.radiusCircular6),
                    ),
                  ),
                ),
                Gaps.h16,
                Text(
                  "Qiymətləndirmə",
                  style: getRegularStyle(
                    color: ColorManager.thirdBlack,
                    fontSize: 14,
                  ),
                ),
                Gaps.h2,
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     StarBox(text: "1"),
                //     StarBox(text: "2"),
                //     StarBox(text: "3"),
                //     StarBox(text: "4"),
                //     StarBox(text: "5"),
                //   ],
                // ),
                // Gaps.h16,
                CustomButton(frontText: "Qəbul Et", onPressed: () {})
              ],
            ),
          ),
        ),
      );
    },
  );
}
