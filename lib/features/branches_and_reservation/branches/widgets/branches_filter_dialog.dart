import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/widgets/branches_filter_content.dart';

import 'package:flutter/material.dart';

void openBranchesFilterBox(BuildContext context, double height) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BranchesFilterContent();
    },
  );
}
