import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/offers/data/model/res/offers_res_model.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/analytics/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../locator.dart';
import '../utils/services/firebase/analytics/analytic_logger.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, required this.offer});

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onPressed: () {
        locator.get<EventLogger>().logEvent(event: Event.select_branch,data: offer.toJson());
        Go.to(Pager.detialedOffer(offer));
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
                  offer.image!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: Paddings.horizontal16,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.title ?? context.locale.offer,
                        style: getMediumStyle(
                          color: ColorManager.mainBlack,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        offer.content,
                        style: getRegularStyle(
                          color: ColorManager.mainBlack,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        offer.discount ?? '',
                        style: getMediumStyle(
                          color: ColorManager.mainBlue,
                          fontSize: 14,
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
