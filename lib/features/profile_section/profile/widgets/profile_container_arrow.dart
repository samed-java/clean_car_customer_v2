import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileContainerArrow extends StatelessWidget {
  final String headerText;
  final Function onPressed;
  const ProfileContainerArrow({
    super.key,
    required this.headerText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.mainWhite,
          borderRadius: BorderRadius.all(Radius.circular(6.r))),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6.r)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              onPressed.call();
            },
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 14.h, bottom: 14.h, left: 16.w, right: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      headerText,
                      style: getMediumStyle(
                          color: ColorManager.mainBlack, fontSize: 16),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 8.h, bottom: 8.h, left: 12.w, right: 12.w),
                        child: SvgPicture.asset(IconAssets.rightArrow),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
