import 'package:animate_do/animate_do.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/choose_car_dialog.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/reservation_location_card.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/widgets/car_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as bounce;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../profile_section/my_cars/data/model/res/my_cars_res_model.dart';
import '../cubit/reservation_cubit.dart';
import '../data/model/res/reservation_parameters_res_model.dart';

class ReservationChooseCar extends StatelessWidget {
  const ReservationChooseCar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReservationCubit>();
    return StreamBuilder<ReservationParametersResModel>(
        stream: cubit.params,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ZoomIn(
              //animate: snapshot.data!.cars?.isNotEmpty ?? false,
              child: ValueListenableBuilder<Car?>(
                  valueListenable: cubit.selectedCar,
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: Paddings.horizontal16,
                          child: Text(
                            "Avtomobili seç",
                            style: getMediumStyle(
                              color: ColorManager.mainBlack,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Gaps.h10,
                        Padding(
                          padding: Paddings.horizontal16,
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    onTap: () {
                                      chooseCarDialog(context,
                                          cars: snapshot.data!.cars!,
                                          car: value,
                                          onSelect: (car) => cubit.selectCar(car));
                                    },
                                    readOnly: true,
                                    cursorColor: ColorManager.thirdBlack,
                                    controller: TextEditingController(text:value?.carModel),
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      suffixIcon: Image.asset(IconAssets.arrowDown),
                                      contentPadding: Paddings.all8,
                                      filled: true,
                                      fillColor: ColorManager.mainWhite,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            RadiusManager.radiusCircular6),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Gaps.w16,
                              bounce.Bounce(
                                onPressed: () {
                                  carInfoDialog(context, isNew: true);
                                },
                                duration: const Duration(milliseconds: 80),
                                child: Container(
                                  width: 44.w,
                                  height: 44.h,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: ColorManager.mainWhite,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Padding(
                                    padding: Paddings.all12,
                                    child: SvgPicture.asset(
                                      IconAssets.plus,
                                      colorFilter: ColorFilter.mode(
                                          ColorManager.mainBlue, BlendMode.srcIn),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            );
          } else {
            return const ReservationContentLoading();
          }
        });
  }
}
