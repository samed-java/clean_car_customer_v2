import 'package:animate_do/animate_do.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/hour_button.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/reservation_location_card.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/res/color_manager.dart';
import '../../../../constants/res/gaps.dart';
import '../../../../constants/res/paddings.dart';
import '../../../../constants/res/styles_manager.dart';
import '../cubit/reservation_cubit.dart';
import '../data/model/res/reservation_parameters_res_model.dart';

class HourButtonWidget extends StatelessWidget {
  const HourButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReservationCubit>();
    return StreamBuilder<ReservationParametersResModel>(
        stream: cubit.params,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.times != null) {
              return ZoomIn(
                  child: Column(
                children: [
                  Padding(
                    padding: Paddings.horizontal16,
                    child: Text(
                      context.locale.selectthehour,
                      style: getMediumStyle(
                        color: ColorManager.mainBlack,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Padding(
                    padding: Paddings.horizontal16,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 16.w,
                      runSpacing: 16.h,
                      children: List.generate(
                        snapshot.data!.times?.length ?? 0,
                        (index) => ValueListenableBuilder<Time?>(
                            valueListenable: cubit.selectedTime,
                            builder: (context, value, child) {
                              return HourButton(
                                hour:
                                    snapshot.data!.times!.elementAt(index).time,
                                isSelected: value ==
                                    snapshot.data!.times!.elementAt(index),
                                isDisabled: snapshot.data!.times!
                                    .elementAt(index)
                                    .isReserved,
                                onPressed: () {
                                  cubit.selectTime(
                                      snapshot.data!.times!.elementAt(index));
                                },
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ));
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return const ReservationContentLoading();
          }
        });
  }
}
