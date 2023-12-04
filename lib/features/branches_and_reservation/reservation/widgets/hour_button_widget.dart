import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/hour_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HourButtonWidget extends StatefulWidget {
  const HourButtonWidget({super.key});

  @override
  State<HourButtonWidget> createState() => _HourButtonWidgetState();
}

class _HourButtonWidgetState extends State<HourButtonWidget> {
  int selectedTypeIndex = -1;
  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> hours = [
      ["10:00", false],
      ["11:00", true],
      ["12:00", false],
      ["12:30", false],
      ["13:00", true],
      ["13:30", false],
      ["14:30", false],
      ["15:00", false],
      ["15:30", true],
      ["16:00", false],
      ["16:30", false],
      ["17:00", false],
    ];

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 16.w,
      runSpacing: 16.h,
      children: List.generate(
        hours.length,
        (index) => HourButton(
          hour: hours[index][0],
          isSelected: selectedTypeIndex == index,
          isDisabled: hours[index][1],
          onPressed: () {
            setState(() {
              selectedTypeIndex = index;
            });
          },
        ),
      ),
    );
  }
}
