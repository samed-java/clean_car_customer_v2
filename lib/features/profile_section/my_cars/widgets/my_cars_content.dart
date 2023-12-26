import 'package:clean_car_customer_v2/constants/res/gaps.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/cubit/my_cars_cubit.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/widgets/add_car_widget.dart';
import 'package:clean_car_customer_v2/features/profile_section/my_cars/widgets/my_car_card.dart';
import 'package:clean_car_customer_v2/utils/enum/car_types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCarsContent extends StatelessWidget {
  const MyCarsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCarsCubit, MyCarsState>(
      builder: (context, state) {
        if (state is MyCarsSuccess) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // Gaps.h10,
                const AddCarWidget(),
                Gaps.h16,
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MyCarCard(
                        car: state.data.cars!.elementAt(index),
                      );
                    },
                    separatorBuilder: (context, index) => Gaps.h16,
                    itemCount: state.data.cars!.length),
                Gaps.h16,
              ],
            ),
          );
        } else if (state is MyCarsLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is MyCarsError) {
          return Center(
              child: Text(
            state.message ?? "",
            style: getMediumStyle(
                color: ColorManager.secondaryBlack, fontSize: FontSize.s16),
          ));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
