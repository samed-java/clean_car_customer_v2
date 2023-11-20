import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onPressed: () {
        Go.to(Pager.detialedOffer);
      },
      duration: const Duration(milliseconds: 100),
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
          color: ColorManager.mainWhite,
          borderRadius: BorderRadius.all(RadiusManager.radiusCircular10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
              child: SizedBox(
                width: 108.w,
                height: 100.h,
                child: Image.network(
                  "https://wavescarwash.co.uk/images/pageImages/Coventry4RebrandPhotos-23102069.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: Paddings.horizontal16,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cola mərkəzi",
                        style: getMediumStyle(
                          color: ColorManager.mainBlack,
                          fontSize: 16.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Avtomobilə qulluq",
                        style: getRegularStyle(
                          color: ColorManager.mainBlack,
                          fontSize: 12.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "12 % endirim",
                        style: getMediumStyle(
                          color: ColorManager.mainBlue,
                          fontSize: 14.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SvgPicture.asset(IconAssets.rightArrow),
            Gaps.w12,
          ],
        ),
      ),
    );
  }
}
