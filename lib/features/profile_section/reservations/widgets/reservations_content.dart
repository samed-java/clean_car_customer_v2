import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/cubit/reservations_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/widgets/reservations_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationsContent extends StatelessWidget {
  const ReservationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationsCubit, ReservationsState>(
      builder: (context, state) {
        if (state is ReservationsSuccess) {
          return ClipRRect(
            borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
            child: SizedBox(
              height: double.infinity,
              child: ReservationsTabBar(
                model: state.reservationsModel,
              ),
            ),
          );
        } else if (state is ReservationsLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is ReservationsErrorState) {
          return Center(
              child: Text(
            state.error,
            style: getMediumStyle(color: ColorManager.mainBlue, fontSize: 16),
          ));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
