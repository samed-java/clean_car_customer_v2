import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/data/model/reservations_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/widgets/reservations_info_card.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/reservations_cubit.dart';

class ReservationsTabBar extends StatelessWidget {
  const ReservationsTabBar({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ReservationsResModel model;

  @override
  Widget build(BuildContext context) {
    List<Active> activeReservations = model.reservations.active;
    List<dynamic> historyReservations = model.reservations.history;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: Paddings.horizontal16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.mainWhite,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: TabBar(
                  indicatorColor: HexColor.fromHex("#4283F1"),
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                      text:  context.locale.active,
                    ),
                    Tab(
                      text: context.locale.history,
                    ),
                  ],
                  labelColor: ColorManager.mainBlue,
                  labelStyle: getSemiBoldStyle(
                      color: ColorManager.mainBlue, fontSize: 14),
                  unselectedLabelColor: ColorManager.mainBlack,
                  unselectedLabelStyle: getMediumStyle(
                      color: ColorManager.mainBlack, fontSize: 14),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: Paddings.all16,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<ReservationsCubit>().execute();
                    },
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: activeReservations.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: Paddings.vertical8,
                          child: ReservationInfoCard(
                            activeReservation: activeReservations[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: Paddings.all16,
                  child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<ReservationsCubit>().execute();
                      },
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: historyReservations.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: Paddings.vertical8,
                          child: ReservationInfoCard(
                            activeReservation: historyReservations[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
