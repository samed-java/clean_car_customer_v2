import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class StarRating extends StatefulWidget {
  final ValueChanged<int> onRatingChanged;
  const StarRating({super.key, required this.onRatingChanged});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => InkWell(
          onTap: () {
            setState(() {
              if (index + 1 == selectedStars) {
                selectedStars = 0;
              } else {
                selectedStars = index + 1;
              }
              widget.onRatingChanged(selectedStars);
            });
          },
          child: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: SvgPicture.asset(
              IconAssets.starEmpty,
              width: 20.w,
              height: 20.h,
              colorFilter: index < selectedStars
                  ? ColorFilter.mode(
                      ColorManager.secondaryOrange, BlendMode.srcATop)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
