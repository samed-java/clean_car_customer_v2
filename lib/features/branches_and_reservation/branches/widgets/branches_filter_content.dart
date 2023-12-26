import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_dropdown_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchesFilterContent extends StatefulWidget {
  const BranchesFilterContent({super.key});

  @override
  State<BranchesFilterContent> createState() => _BranchesFilterContentState();
}

class _BranchesFilterContentState extends State<BranchesFilterContent> {
  @override
  Widget build(BuildContext context) {
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
                "Şəhər",
                style: getRegularStyle(
                  color: ColorManager.thirdBlack,
                  fontSize: 14,
                ),
              ),
              // const CustomDropDownButton(
              //   defaultValue: null,
              // ),

              Gaps.h16,
              // Bölgə
              Text(
                "Bölgə",
                style: getRegularStyle(
                  color: ColorManager.thirdBlack,
                  fontSize: 14,
                ),
              ),
              // const CustomDropDownButton(
              //   defaultValue: "Bölgə seç",
              // ),

              Gaps.h16,
              // Qəsəbə
              Text(
                "Qəsəbə",
                style: getRegularStyle(
                  color: ColorManager.thirdBlack,
                  fontSize: 14,
                ),
              ),
              // const CustomDropDownButton(
              //   defaultValue: "Qəsəbə seç",
              // ),

              Gaps.h16,
              Text(
                "Xidmət növü",
                style: getRegularStyle(
                  color: ColorManager.thirdBlack,
                  fontSize: 14,
                ),
              ),
              Gaps.h2,
             // const CustomDropDownButton(defaultValue: "Xidmət növü seç"),

              Gaps.h24,

              CustomButton(frontText: "Qəbul Et", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
