import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/constants/res/paddings.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchTimeTypeSelection extends StatefulWidget {
  const BranchTimeTypeSelection({
    super.key,
    required this.onFullTimeStatusChanged,
    required this.initValue,
  });

  final void Function(bool) onFullTimeStatusChanged;
  final bool initValue;

  @override
  State<BranchTimeTypeSelection> createState() =>
      _BranchTimeTypeSelectionState();
}

class _BranchTimeTypeSelectionState extends State<BranchTimeTypeSelection> {
  late bool isFullTimeSelected;

  @override
  void initState() {
    isFullTimeSelected = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Bounce(
          duration: DurationConstant.ms100,
          onPressed: () {
            setState(() {
              isFullTimeSelected = !isFullTimeSelected;
              widget.onFullTimeStatusChanged.call(isFullTimeSelected);
            });
          },
          child: Container(
            padding: Paddings.horizontal8,
            height: 40.h,
            decoration: isFullTimeSelected
                ? BoxDecoration(
                    color: ColorManager.mainWhite,
                    borderRadius:
                        BorderRadius.all(RadiusManager.radiusCircular4),
                    boxShadow: [
                        BoxShadow(
                            blurRadius: 4.0,
                            color: ColorManager.mainBlue.withOpacity(0.1)),
                      ])
                : BoxDecoration(
                    color: ColorManager.mainBlue.withOpacity(0.08),
                    border: Border.all(color: ColorManager.mainBlue),
                    borderRadius:
                        BorderRadius.all(RadiusManager.radiusCircular4),
                  ),
            child: Center(
              child: Text(
                context.locale.all,
                style: getMediumStyle(
                    color: !isFullTimeSelected
                        ?ColorManager.mainBlue
                        : ColorManager.secondaryBlack,
                    fontSize: FontSize.s14),
              ),
            ),
          ),
        ),
        12.horizontalSpace,
        Bounce(
          duration: DurationConstant.ms100,
          onPressed: () {
            setState(() {
              isFullTimeSelected = !isFullTimeSelected;
              widget.onFullTimeStatusChanged.call(isFullTimeSelected);
            });
          },
          child: Container(
            padding: Paddings.horizontal8,
            height: 40.h,
            decoration: !isFullTimeSelected
                ? BoxDecoration(
                color: ColorManager.mainWhite,
                borderRadius:
    BorderRadius.all(RadiusManager.radiusCircular4),
    boxShadow: [
    BoxShadow(
    blurRadius: 4.0,
    color: ColorManager.mainBlue.withOpacity(0.1)),
    ])
                :BoxDecoration(
    color: ColorManager.mainBlue.withOpacity(0.08),
    border: Border.all(color: ColorManager.mainBlue),
    borderRadius:
    BorderRadius.all(RadiusManager.radiusCircular4),
    ) ,
            child: Center(
              child: Text(
                "7/24",
                style: getMediumStyle(
                    color: isFullTimeSelected
                        ? ColorManager.mainBlue
                        : ColorManager.secondaryBlack ,
                    fontSize: FontSize.s14),
              ),
            ),
          ),
        )
      ],
    );
  }
}
