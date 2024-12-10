import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/analytics/analytic_logger.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/analytics/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({Key? key, required this.model, required this.headTitle}) : super(key: key);
  final Washing model;
  final String headTitle;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 100),
      onPressed: () {
        locator.get<EventLogger>().logEvent(event: Event.select_branch,data: model.toJson());
        Go.to(Pager.branch(model));
      },
      child: Hero(
        tag: '$headTitle-${model.id}-${model.title}',
        child: Container(
          margin: Paddings.horizontal8,
          decoration: BoxDecoration(
            color: ColorManager.mainWhite,
            borderRadius: BorderRadius.circular(6.r),
          ),
          height: 160.h,
          width: 148.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CachedNetworkImage(
                    imageUrl: model.images!.isNotEmpty
                        ? model.images!.first.image!
                        : "https://wavescarwash.co.uk/images/pageImages/Coventry4RebrandPhotos-23102069.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          ColorManager.mainBlack.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            width: 148.w,
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              model.title!,
                              overflow: TextOverflow.ellipsis,
                              style: getSemiBoldStyle(
                                  color: ColorManager.mainWhite, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: Paddings.all16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.mainWhite,
                          borderRadius:
                              BorderRadius.all(RadiusManager.radiusCircular4),
                        ),
                        width: 55.w,
                        height: 28.h,
                        child: Padding(
                          padding: Paddings.horizontal4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                model.rating!,
                                style: getMediumStyle(
                                    color: ColorManager.mainBlack,
                                    fontSize: 14),
                              ),
                              8.horizontalSpace,
                              SvgPicture.asset(IconAssets.star)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
