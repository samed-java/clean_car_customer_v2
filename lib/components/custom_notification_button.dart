import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 50),
      onPressed: () {
        // Call the onPressed callback when the button is pressed
        onPressed();
      },
      child: Stack(
        children: [
          Container(
            width: 20,
            height: 20,
            color: Colors.transparent,
            child: SvgPicture.asset(IconAssets.notificationIcon),
          ),
          Positioned(
            right: 3.w,
            child: Container(
              width: 6.sp,
              height: 6.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.mainBlue
              ),
            ),
          )
        ],
      ),
    );
  }
}
