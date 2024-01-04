import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/home/data/model/res/branchs_res_model.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailedBranchCard extends StatelessWidget {
  const DetailedBranchCard({super.key, required this.model});
  final Washing model;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Bounce(
      duration: const Duration(milliseconds: 100),
      onPressed: () {
        Go.to(Pager.branch(model));
      },
      child: Hero(
        tag: '${model.id}-${model.title}',
        child: Container(
          height: height * (160 / 816),
          width: width * (336 / 375),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CachedNetworkImage(
                    imageUrl: model.images.isNotEmpty
                        ? model.images.first.image
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
                          ColorManager.mainBlack.withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              model.title,
                              overflow: TextOverflow.ellipsis,
                              style: getSemiBoldStyle(
                                  color: ColorManager.mainWhite, fontSize: 16),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              "Nizami filialı, Xocasən rayonu 158",
                              overflow: TextOverflow.ellipsis,
                              style: getMediumStyle(
                                  color: ColorManager.mainWhite, fontSize: 14),
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
                        width: 50.w,
                        height: 28.h,
                        child: Padding(
                          padding: Paddings.horizontal4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                model.rating,
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
