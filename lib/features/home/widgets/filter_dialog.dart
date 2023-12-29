import 'package:clean_car_customer_v2/features/home/widgets/filterbox_content.dart';

import 'package:flutter/material.dart';

void openHomeFilterBox(BuildContext c, double height) {
  showDialog(
    context: c,
    builder: (BuildContext context) {
      return FilterBoxContent(topContext: c,);
    },
  );
}
