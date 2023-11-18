import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Paddings.horizontal8,
      decoration: BoxDecoration(
        color: ColorManager.mainWhite,
        borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
      ),
      height: 160.h,
      width: 148.w,
      child: ClipRRect(
        borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.network(
                "https://wavescarwash.co.uk/images/pageImages/Coventry4RebrandPhotos-23102069.jpeg",
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
                child: Text(
                  "Xocahəsən",
                  style: getSemiBoldStyle(
                      color: ColorManager.mainWhite, fontSize: 16),
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
            ),
          ],
        ),
      ),
    );
  }
}
