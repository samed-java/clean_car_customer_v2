import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/components/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBlue,
      body: SafeArea(
        top: true,
        bottom: false,
        left: true,
        right: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 20.w),
              child: Text(
                "Təkliflər",
                style: getSemiBoldStyle(
                  color: ColorManager.mainWhite,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height * (712 / 816),
                decoration: BoxDecoration(
                  color: ColorManager.mainBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Padding(
                  padding: Paddings.all16,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, builder) {
                        return Padding(
                          padding: Paddings.vertical8,
                          child: const OfferCard(),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
