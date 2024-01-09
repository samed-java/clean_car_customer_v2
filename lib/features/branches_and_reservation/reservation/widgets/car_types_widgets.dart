import 'package:animate_do/animate_do.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/car_type_button.dart';
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

class CarTypesWidgets extends StatefulWidget {
  const CarTypesWidgets({super.key});

  @override
  State<CarTypesWidgets> createState() => _CarTypesWidgetsState();
}

class _CarTypesWidgetsState extends State<CarTypesWidgets> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReservationCubit>();
    return StreamBuilder<ReservationParametersResModel>(
        stream: cubit.params,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.services != null) {
              return ZoomIn(
                  //animate: snapshot.data!.cars?.isNotEmpty ?? false,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: Paddings.horizontal16,
                    child: Text(
                      context.locale.selectservice,
                      style: getMediumStyle(
                        color: ColorManager.mainBlack,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Gaps.h10,
                  SizedBox(
                    height: 110.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.services!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: ValueListenableBuilder<Service?>(
                              valueListenable: cubit.selectedService,
                              builder: (context, value, child) {
                                return CarTypeButton(
                                  onPressed: () {
                                    cubit.selectService(snapshot.data!.services!
                                        .elementAt(index));
                                  },
                                  iconPath: snapshot.data!.services!
                                      .elementAt(index)
                                      .icon,
                                  isSelected: value ==
                                      snapshot.data!.services!.elementAt(index),
                                  header: snapshot.data!.services!
                                      .elementAt(index)
                                      .title,
                                  subText: snapshot.data!.services!
                                      .elementAt(index)
                                      .price,
                                );
                              }),
                        );
                      },
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

  // List<String> getImagePathForType(WashingTypes type) {
  //   switch (type) {
  //     case WashingTypes.premium:
  //       return [IconAssets.carPremium, "Premium", "yuma"];
  //     case WashingTypes.detailed:
  //       return [IconAssets.carDetailed, "Detallı", "yuma"];
  //     case WashingTypes.ceramic:
  //       return [IconAssets.carCeramic, "Keramik", "örtükləmə"];
  //     case WashingTypes.chemical:
  //       return [IconAssets.carChemical, "Kimyəvi", "təmizləmə"];
  //     case WashingTypes.engine:
  //       return [IconAssets.carEngine, "Mühərrik", "yuma"];
  //     case WashingTypes.inside:
  //       return [IconAssets.carInside, "İç", "yuma"];
  //     case WashingTypes.outside:
  //       return [IconAssets.carOutside, "Çöl", "yuma"];
  //     case WashingTypes.nano:
  //       return [IconAssets.carNano, "Nano", "yuma"];
  //     case WashingTypes.polishing:
  //       return [IconAssets.carPolishing, "Cilalama", "prosesi"];
  //     default:
  //       return [IconAssets.carAuto, "Avto", "yuma"];
  //   }
  // }
}
