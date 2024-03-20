import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EvaluationInfoCard extends StatelessWidget {
  const EvaluationInfoCard({super.key, required this.branch, required this.service});

  final String branch;
  final String service;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.mainWhite,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(IconAssets.clock),
                Gaps.w4,
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '${context.locale.service} : ',
                        style: getSemiBoldStyle(
                            color: ColorManager.mainBlack, fontSize: 14),
                      ),
                      TextSpan(
                        text: service,
                        style: getMediumStyle(
                            color: ColorManager.mainBlack, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gaps.h8,
            Row(
              children: [
                SvgPicture.asset(IconAssets.location),
                Gaps.w4,
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '${context.locale.branch} : ',
                        style: getSemiBoldStyle(
                            color: ColorManager.mainBlack, fontSize: 14),
                      ),
                      TextSpan(
                        text: branch,
                        style: getMediumStyle(
                            color: ColorManager.mainBlack, fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
