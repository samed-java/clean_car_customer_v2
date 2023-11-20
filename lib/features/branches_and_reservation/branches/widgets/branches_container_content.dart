import 'package:clean_car_customer_v2/components/custom_filter_button.dart';
import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/widgets/branches_filter_dialog.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/widgets/detailed_branch_card.dart';
import 'package:flutter/material.dart';

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
          child: ListView.builder(
            // padding: Paddings.vertical16,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, builder) {
              return Padding(
                padding: Paddings.vertical8,
                child: const DetailedBranchCard(),
              );
            },
            itemCount: 1,
          ),
        )
      ],
    );
  }
}
