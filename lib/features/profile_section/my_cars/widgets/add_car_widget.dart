import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/widgets/car_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCarWidget extends StatelessWidget {
  const AddCarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onPressed: () {
        carInfoDialog(context,isNew: true);
      },
      duration: const Duration(milliseconds: 50),
      child: Row(
        children: [
          SvgPicture.asset(
            IconAssets.plus,
            height: 14.h,
            width: 14.w,
            colorFilter:
                ColorFilter.mode(ColorManager.mainBlue, BlendMode.srcIn),
          ),
          Gaps.w8,
          Text(
            "avtomobil əlavə et",
            style: getMediumStyle(color: ColorManager.mainBlue, fontSize: 16),
          )
        ],
      ),
    );
  }
}
