import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarTypeButton extends StatelessWidget {
  final String iconPath;
  final Function onPressed;
  final bool isSelected;
  final String header;
  final String subText;
  // final Color backgroundColor;
  // final Color foregroundColor;

  const CarTypeButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
    required this.isSelected,
    required this.header,
    required this.subText,

    // required this.backgroundColor,
    // required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        width: 128.w,
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.mainBlue : ColorManager.mainWhite,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          16.verticalSpace,
          CachedNetworkImage(
            imageUrl:iconPath,
            height: 28.h,
            width: 28.w,
            color: !isSelected ? ColorManager.mainBlue : ColorManager.mainWhite,
            // colorFilter: ColorFilter.mode(
            //     isSelected ? ColorManager.mainWhite : ColorManager.mainBlue,
            //     BlendMode.srcIn),
          ),
          Spacer(),
          Text(
            header,
            textAlign: TextAlign.center,
            style: getMediumStyle(
              color:
                  isSelected ? ColorManager.mainWhite : ColorManager.mainBlack,
              fontSize: 14,
            ),
          ),
          Text(
            subText,
            style: getMediumStyle(
              color:
                  isSelected ? ColorManager.mainWhite : ColorManager.mainBlack,
              fontSize: 14,
            ),
          ),
        ]),
      ),
    );
  }
}
