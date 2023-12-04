import 'package:clean_car_customer_v2/features/home/widgets/filterbox_content.dart';

import 'package:flutter/material.dart';

void openHomeFilterBox(BuildContext context, double height) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return FilterBoxContent();
    },
  );
}
