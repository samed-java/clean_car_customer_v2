import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/navigation_service/navigation_service.dart';

class Sheets {
  Sheets._();

  static void showExtraDetailSheet({
    required String title,
    required String content,
    String? endDate,
    void Function()? action,
    String? actionText,
    Widget? actionIcon,
  }) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: RadiusManager.radiusCircular16,
                topRight: RadiusManager.radiusCircular16)),
        backgroundColor: ColorManager.mainBackgroundColor,
        context: NavigationService.instance.context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: Paddings.all16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        context.locale.detailed,
                        style: getSemiBoldStyle(
                            color: ColorManager.mainBlue,
                            fontSize: FontSize.s18),
                      ),
                      Bounce(
                        duration: DurationConstant.ms100,
                        onPressed: () => Go.back(),
                        child: Icon(
                          Icons.close,
                          color: ColorManager.mainBlack,
                          size: 20.sp,
                        ),
                      )
                    ],
                  ),
                  16.verticalSpace,
                  Container(
                    padding: Paddings.all8,
                    decoration: BoxDecoration(
                        color: ColorManager.mainWhite,
                        borderRadius:
                            BorderRadius.all(RadiusManager.radiusCircular6)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 1.sw,
                          child: Text(
                            title,
                            style: getMediumStyle(
                                color: ColorManager.mainBlack,
                                fontSize: FontSize.s14),
                          ),
                        ),
                        8.verticalSpace,
                        SizedBox(
                          width: 1.sw,
                          child: Text(
                            content,
                            style: getSemiBoldStyle(
                                color: ColorManager.thirdBlack,
                                fontSize: FontSize.s14),
                          ),
                        ),
                        if (endDate != null) ...[
                          8.verticalSpace,
                          SizedBox(
                            width: 1.sw,
                            child: Text.rich(
                              TextSpan(
                                  text: "Bitme muddeti: ",
                                  style: getSemiBoldStyle(
                                      color: ColorManager.thirdBlack,
                                      fontSize: FontSize.s14),
                                  children: [
                                    TextSpan(
                                      text: endDate,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.mainRed,
                                          fontSize: FontSize.s14),
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                  if (actionText != null)
                    ...[
                    16.verticalSpace,
                    CustomButton(
                        frontText: actionText,
                        prefixIcon: actionIcon,
                        onPressed: () => action?.call())
                  ]
                ],
              ),
            ),
          );
        });
  }
}
