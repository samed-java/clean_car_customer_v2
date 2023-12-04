import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.text,
    required this.isSelected,
  });
  final Function() onPressed;
  final String iconPath;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        height: 84.h,
        width: 160.w,
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.mainBlue : ColorManager.mainWhite,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isSelected ? ColorManager.mainWhite : ColorManager.mainBlue,
                BlendMode.srcIn,
              ),
            ),
            Text(
              text,
              style: getMediumStyle(
                  color: isSelected
                      ? ColorManager.mainWhite
                      : ColorManager.secondaryBlack,
                  fontSize: 14),
            ),
          ],
        )),
      ),
    );
  }
}
