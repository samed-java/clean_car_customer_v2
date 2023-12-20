import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReservationLocationCard extends StatelessWidget {
  const ReservationLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.mainWhite,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: Paddings.all16,
        child: Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: ColorManager.mainBackgroundColor,
              child: SvgPicture.asset(
                IconAssets.location,
                height: 24.h,
                width: 24.w,
              ),
            ),
            Gaps.w8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nizami filialı",
                  style: getMediumStyle(
                      color: ColorManager.mainBlack, fontSize: 14),
                ),
                Text(
                  "Haji Jafarli st. 123",
                  style: getMediumStyle(
                      color: ColorManager.mainBlack, fontSize: 12),
                ),
              ],
            ),
            Expanded(child: Gaps.empty),
            Bounce(
              onPressed: () {
                Go.to(Pager.branches);
              },
              duration: const Duration(milliseconds: 100),
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SizedBox(
                  child: Padding(
                    padding: Paddings.all4,
                    child: SvgPicture.asset(
                      IconAssets.pencil,
                      height: 16.h,
                      width: 16.w,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
