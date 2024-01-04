import 'package:clean_car_customer_v2/components/custom_filter_button.dart';
import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/widgets/branches_filter_dialog.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/widgets/detailed_branch_card.dart';
import 'package:clean_car_customer_v2/features/home/widgets/filter_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/cubit/home_cubit.dart';

class BranchesContent extends StatelessWidget {
  BranchesContent({super.key});
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * (452 / 816);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSearchBar(focusNode: _focusNode),
            FilterButton(
              onPressed: () {
                openHomeFilterBox(context, height);
              },
            )
          ],
        ),
        Gaps.h16,
        Expanded(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: Paddings.vertical8,
                      child: DetailedBranchCard(
                        model: state.data.washings[index],
                      ),
                    );
                  },
                  itemCount: state.data.washings.length,
                );
              } else if (state is HomeLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is HomeFail) {
                return Center(
                  child: Text(state.message),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        )
      ],
    );
  }
}
