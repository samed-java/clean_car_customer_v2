import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final ValueNotifier<bool> isCheckedNotifier;
  final bool isWhite;
  final Function? onChanged;
  const CustomCheckbox(
      {super.key,
      required this.isCheckedNotifier,
      this.onChanged,
      this.isWhite = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isCheckedNotifier.value = !isCheckedNotifier.value;
        if (onChanged != null) {
          onChanged?.call();
        }
      },
      child: ValueListenableBuilder<bool>(
          valueListenable: isCheckedNotifier,
          builder: (context, value, _) {
            return Row(
              children: [
                Container(
                  width: 20.r,
                  height: 20.r,
                  decoration: BoxDecoration(
                      border: !isWhite
                          ? Border.all(
                              color: ColorManager.secondaryBlack,
                              width: 0.5,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(4),
                      color: ColorManager.mainWhite),
                  child: Container(
                    child: value
                        ? Icon(
                            Icons.check,
                            size: 16.r,
                            color: ColorManager.mainBlue,
                          )
                        : null,
                  ),
                ),
                Gaps.w8,
              ],
            );
          }),
    );
  }
}
