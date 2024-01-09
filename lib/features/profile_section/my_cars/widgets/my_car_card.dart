import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_car_customer_v2/components/padded_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/enum/car_types.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../cubit/my_cars_cubit.dart';
import '../data/model/res/my_cars_res_model.dart';
import 'car_info_dialog.dart';

class MyCarCard extends StatelessWidget {
  final Car car;

  const MyCarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.mainWhite,
          borderRadius: BorderRadius.circular(6.r)),
      child: Padding(
        padding:
            EdgeInsets.only(top: 12.h, bottom: 12.h, left: 16.w, right: 16.w),
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor: ColorManager.mainBackgroundColor,
                radius: 24.r,
                child: CachedNetworkImage(
                  imageUrl: car.banType?.icon ?? '',
                )
                //: SvgPicture.asset(ImageAssets.jeep),
                ),
            Gaps.w12,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.carModel,
                  style: getMediumStyle(
                      color: ColorManager.mainBlack, fontSize: 14),
                ),
                Text(
                  car.carNumber,
                  style: getMediumStyle(
                      color: ColorManager.mainBlack, fontSize: 12),
                ),
              ],
            ),
            Expanded(child: Gaps.empty),
            PaddedButton(
                frontText: context.locale.detailed,
                onPressed: () {
                  context.read<MyCarsCubit>().nameController.text =
                      car.carModel;
                  context.read<MyCarsCubit>().numberController.text =
                      car.carNumber;
                  context.read<MyCarsCubit>().selectedBanType = car.banType?.id;
                  carInfoDialog(context, selectedCarId: car.id);
                })
          ],
        ),
      ),
    );
  }
}
