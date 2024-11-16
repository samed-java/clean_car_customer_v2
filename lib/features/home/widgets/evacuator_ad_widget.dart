import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EvacuatorAdWidget extends StatelessWidget {
  const EvacuatorAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Paddings.horizontal16,
      padding: Paddings.all16,
      decoration: BoxDecoration(
          color: ColorManager.mainWhite,
          borderRadius: BorderRadius.all(RadiusManager.radiusCircular10)),
      width: 1.sw,
      height: 152,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CleanCar Evakuator ",
                    style: getSemiBoldStyle(
                        color: ColorManager.mainBlue, fontSize: AppSize.s14),
                    ),
                Text(
                    "mobil tətbiqi tezliklə xidmətinizdə !!!",
                    style: getMediumStyle(
                        color: ColorManager.mainBlack,
                        fontSize: AppSize.s14)),
                Spacer(),
                SizedBox(
                    width: 96.w,
                    child: CustomButton(
                        frontText: context.locale.detailed, onPressed: () {}))
              ],
            ),
          ),
          SvgPicture.asset(ImageAssets.evacuatorAd)
        ],
      ),
    );
  }
}
