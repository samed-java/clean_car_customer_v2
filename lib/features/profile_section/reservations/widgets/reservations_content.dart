import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/widgets/reservations_tabbar.dart';
import 'package:flutter/material.dart';

class ReservationsContent extends StatelessWidget {
  const ReservationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
      child: const SizedBox(
        height: double.infinity,
        child: ReservationsTabBar(),
      ),
    );
  }
}
