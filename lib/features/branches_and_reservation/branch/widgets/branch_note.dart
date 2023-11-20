import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';

class BranchNoteWidget extends StatelessWidget {
  const BranchNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 64.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.mainWhite,
          borderRadius: BorderRadius.all(RadiusManager.radiusCircular6)),
      child: Padding(
        padding: Paddings.all10,
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Qeyd ',
                style: getSemiBoldStyle(
                    color: ColorManager.mainBlue, fontSize: 14),
              ),
              TextSpan(
                text:
                    ': Avtoyumada İFOAM firmasının məhsullarından istifadə olunur',
                style:
                    getMediumStyle(color: ColorManager.mainBlack, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
