import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branch/widgets/branch_image.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchUpper extends StatelessWidget {
  const BranchUpper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double topSafeAreaHeight = MediaQuery.of(context).padding.top;

    return Stack(
      children: [
        SizedBox(height: 350.h, child: const BranchImage()),
        Positioned(
          top: topSafeAreaHeight,
          right: 0,
          child: Padding(
            padding: Paddings.all24,
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.mainWhite,
                borderRadius: BorderRadius.all(RadiusManager.radiusCircular4),
              ),
              width: 41.w,
              height: 28.h,
              child: Padding(
                padding: Paddings.horizontal4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "5",
                      style: getMediumStyle(
                          color: ColorManager.mainBlack, fontSize: 14),
                    ),
                    SvgPicture.asset(IconAssets.star)
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: topSafeAreaHeight,
          left: 0,
          child: Padding(
            padding: Paddings.all24,
            child: Bounce(
              duration: const Duration(milliseconds: 100),
              onPressed: () {
                Go.back();
              },
              child: Container(
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(RadiusManager.radiusCircular2),
                  color: ColorManager.mainWhite,
                ),
                child: Image.asset(IconAssets.backButton),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
