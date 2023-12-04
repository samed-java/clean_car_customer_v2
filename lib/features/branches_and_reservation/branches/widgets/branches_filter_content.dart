import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_textfield_widget.dart';
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
  List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem<String>(
      value: "",
      child: Text(""),
    ),
    const DropdownMenuItem<String>(
      value: "One",
      child: Text("One"),
    ),
    const DropdownMenuItem<String>(
      value: "Two",
      child: Text("Two"),
    ),
    const DropdownMenuItem<String>(
      value: "Three",
      child: Text("Three"),
    ),
  ];
  String drowDownValue = "";
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
              Container(
                height: 40.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r)),
                child: Padding(
                  padding: Paddings.horizontal16,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      disabledHint: null,
                      // isDense: true,
                      underline: null,
                      borderRadius: BorderRadius.circular(6.r),
                      isExpanded: true,
                      value: drowDownValue,
                      icon: Image.asset(IconAssets.arrowDown),
                      items: items,
                      onChanged: (String? newValue) {
                        setState(() {
                          drowDownValue = newValue!;
                        });
                      },
                    ),
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
              CustomButton(frontText: "Qəbul Et", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
