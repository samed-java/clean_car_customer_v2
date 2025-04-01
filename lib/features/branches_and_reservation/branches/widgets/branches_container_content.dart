import 'package:clean_car_customer_v2/components/custom_filter_button.dart';
import 'package:clean_car_customer_v2/components/custom_filter_reset_button.dart';
import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/widgets/detailed_branch_card.dart';
import 'package:clean_car_customer_v2/features/home/widgets/filter_dialog.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/analytics/analytic_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/cubit/home_cubit.dart';

class BranchesContent extends StatelessWidget {
  const BranchesContent({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * (452 / 816);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomSearchBar(
                focusNode: context.read<HomeCubit>().focusNode,
                searchController: context.read<HomeCubit>().searchController,
                onSubmit: () {
                  locator.get<EventLogger>().logSearch(
                      searchTerm:
                          context.read<HomeCubit>().searchController.text);
                  context.read<HomeCubit>().execute();
                },
              ),
            ),
            16.horizontalSpace,
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              if (context.read<HomeCubit>().isFilterNotEmpty) {
                return Row(
                  children: [
                    FilterResetButton(
                      onPressed: () {
                        context.read<HomeCubit>().clearFilter();
                      },
                    ),
                    16.horizontalSpace
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
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
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<HomeCubit>().execute();
                  },
                  child: context
                          .read<HomeCubit>()
                          .filteredResult!
                          .washings!
                          .isEmpty
                      ? const Center(
                          child: Text("Empty"),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: Paddings.vertical8,
                              child: DetailedBranchCard(
                                model: context
                                    .read<HomeCubit>()
                                    .filteredResult!
                                    .washings![index],
                              ),
                            );
                          },
                          itemCount: context
                              .read<HomeCubit>()
                              .filteredResult!
                              .washings!
                              .length,
                        ),
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
