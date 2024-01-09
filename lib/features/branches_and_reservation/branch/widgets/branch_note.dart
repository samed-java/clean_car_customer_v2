import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import 'package:flutter/material.dart';

import '../../../home/data/model/res/branchs_res_model.dart';

class BranchNoteWidget extends StatelessWidget {
  const BranchNoteWidget({super.key,required this.model});

  final Washing model;

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
                    ': ${model.description}',
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
