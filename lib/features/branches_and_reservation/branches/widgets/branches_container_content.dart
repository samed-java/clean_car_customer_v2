import 'package:clean_car_customer_v2/components/custom_filter_button.dart';
import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/widgets/branches_filter_dialog.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/widgets/detailed_branch_card.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/cubit/regions_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                openBranchesFilterBox(context, height);
              },
            )
          ],
        ),
        Gaps.h16,
        Expanded(
          child: BlocBuilder<RegionsCubit, RegionsState>(
            builder: (context, state) {
              if (state is RegionsSuccess) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: Paddings.vertical8,
                      child: DetailedBranchCard(
                        model: state.data.regions[index],
                      ),
                    );
                  },
                  itemCount: state.data.regions.length,
                );
              } else if (state is RegionsLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is RegionsFail) {
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
