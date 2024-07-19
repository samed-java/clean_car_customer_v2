import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/cubit/reservation_cubit.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/choose_car_radio_button.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/data/model/res/my_cars_res_model.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/custom_searchbar.dart';
import '../../../profile_section/my_cars/widgets/car_info_dialog.dart';
import '../data/model/res/reservation_parameters_res_model.dart';
import 'choose_branch_content.dart';

void chooseCarDialog(
  BuildContext c, {
  required List<Car> cars,
  required Car? car,
      required ReservationCubit cubit,
  required Function(Car) onSelect,
}) {
  showDialog(
    context: c,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorManager.mainBackgroundColor,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
        content: Container(
          width: 320.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.locale.selectthecar,
                      style: getSemiBoldStyle(
                        color: ColorManager.mainBlue,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Go.back();
                      },
                      child: SizedBox(
                        child: Padding(
                          padding: Paddings.all6,
                          child: SvgPicture.asset(
                            IconAssets.exit,
                            height: 16.h,
                            width: 16.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ChooseCarRadioButton(
                  cars: cars,
                  onSelect: onSelect,
                  selected: car,
                ),
                CustomButton(frontText: context.locale.addcar, onPressed: (){
                  Go.back();
                  carInfoDialog(c, isNew: true,
                      onFinish: (value) {
                        cubit.execute();
                      });
                })
              ],
            ),
          ),
        ),
      );
    },
  );
}

void chooseBranch(
  BuildContext context, {
  required List<Branch> branchs,
  required Branch? selected,
  required Function(Branch) onSelect,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorManager.mainBackgroundColor,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
        content: ChooseBranchContent(
          branchs: branchs,
          onSelect: onSelect,
          selected: selected,
        ),
      );
    },
  );
}
