import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/evaluation/widgets/star_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class StarCardWidget extends StatelessWidget {
  const StarCardWidget({super.key, required this.onRatingChanged});
  final ValueChanged<int> onRatingChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text(
              "Qiymətləndir",
              style: getSemiBoldStyle(
                color: ColorManager.mainBlack,
                fontSize: 14,
              ),
            ),
            Gaps.h8,
            StarRating(onRatingChanged: onRatingChanged),
          ],
        ),
      ),
    );
  }
}
