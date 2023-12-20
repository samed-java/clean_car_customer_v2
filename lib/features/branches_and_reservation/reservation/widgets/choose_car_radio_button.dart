import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseCarRadioButton extends StatefulWidget {
  const ChooseCarRadioButton({super.key});

  @override
  State<ChooseCarRadioButton> createState() => _ChooseCarRadioButtonState();
}

class _ChooseCarRadioButtonState extends State<ChooseCarRadioButton> {
  int selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gaps.h12,
          GestureDetector(
            onTap: () {
              setState(() {
                selectedRadio = 1;
              });
            },
            child: Container(
              padding: Paddings.all10,
              decoration: BoxDecoration(
                color: ColorManager.mainWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: ColorManager.mainBackgroundColor,
                    child: Center(
                      child: SvgPicture.asset(ImageAssets.sedan),
                    ),
                  ),
                  Gaps.w8,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mercedes Benz",
                        style: getMediumStyle(
                            color: ColorManager.mainBlack, fontSize: 14),
                      ),
                      Text(
                        "03-HJ-490",
                        style: getMediumStyle(
                            color: ColorManager.secondaryBlack, fontSize: 12),
                      ),
                    ],
                  ),
                  Expanded(child: Gaps.empty),
                  Transform.scale(
                    scale: 1.4,
                    child: Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (int? value) {
                        setState(() {
                          selectedRadio = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gaps.h10,
          GestureDetector(
            onTap: () {
              setState(() {
                selectedRadio = 2;
              });
            },
            child: Container(
              padding: Paddings.all10,
              decoration: BoxDecoration(
                color: ColorManager.mainWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: ColorManager.mainBackgroundColor,
                    child: Center(
                      child: SvgPicture.asset(ImageAssets.jeep),
                    ),
                  ),
                  Gaps.w8,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "KIA Ronta",
                        style: getMediumStyle(
                            color: ColorManager.mainBlack, fontSize: 14),
                      ),
                      Text(
                        "03-HJ-490",
                        style: getMediumStyle(
                            color: ColorManager.secondaryBlack, fontSize: 12),
                      ),
                    ],
                  ),
                  Expanded(child: Gaps.empty),
                  Transform.scale(
                    scale: 1.4,
                    child: Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (int? value) {
                        setState(() {
                          selectedRadio = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gaps.h10,
        ],
      ),
    );
  }
}
