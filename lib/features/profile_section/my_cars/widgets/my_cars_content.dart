import 'package:clean_car_customer_v2/constants/res/gaps.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/widgets/add_car_widget.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/widgets/my_car_card.dart';
import 'package:clean_car_customer_v2/utils/enum/car_types.dart';
import 'package:flutter/material.dart';

class MyCarsContent extends StatelessWidget {
  const MyCarsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Gaps.h10,
          const AddCarWidget(),
          Gaps.h16,
          const MyCarCard(
            carTypes: CarTypes.sedan,
            name: "Mercedes Benz",
            number: "03-HJ-490",
          ),
          Gaps.h16,
          const MyCarCard(
            carTypes: CarTypes.jeep,
            name: "KIA Ronta",
            number: "03-HJ-490",
          ),
          Gaps.h16,
          const MyCarCard(
            carTypes: CarTypes.sedan,
            name: "Audi",
            number: "03-HJ-490",
          ),
          Gaps.h16,
        ],
      ),
    );
  }
}
