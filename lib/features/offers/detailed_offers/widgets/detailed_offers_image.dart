import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedOfferImage extends StatelessWidget {
  const DetailedOfferImage({super.key,required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    double topSafeAreaHeight = MediaQuery.of(context).padding.top;

    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(6.r), bottomRight: Radius.circular(6.r)),
      child: Stack(
        children: [
          SizedBox(
            height: 350.h,
            width: double.infinity,
            child: Image.network(
              image,
              fit: BoxFit.fill,
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
                    borderRadius:
                        BorderRadius.all(RadiusManager.radiusCircular2),
                    color: ColorManager.mainWhite,
                  ),
                  child: Image.asset(IconAssets.backButton),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
