import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileContainer extends StatelessWidget {
  final String headerText;
  final Function onPressed;
  final Widget suffix;
  const ProfileContainer({
    super.key,
    required this.headerText,
    required this.onPressed,
    required this.suffix,
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
                    suffix,
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
