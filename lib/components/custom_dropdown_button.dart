import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownButton extends StatefulWidget {
  final String defaultValue;

  const CustomDropDownButton({
    Key? key,
    required this.defaultValue,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  late String drowDownValue;
  late List<DropdownMenuItem<String>> items;

  @override
  void initState() {
    super.initState();

    // Access widget.defaultValue in initState
    drowDownValue = widget.defaultValue;

    // Initialize items using widget.defaultValue
    items = [
      DropdownMenuItem<String>(
        value: widget.defaultValue,
        child: Text(widget.defaultValue),
      ),
      const DropdownMenuItem<String>(
        value: "One",
        child: Text("One"),
      ),
      const DropdownMenuItem<String>(
        value: "Two",
        child: Text("Two"),
      ),
      const DropdownMenuItem<String>(
        value: "Three",
        child: Text("Three"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
      child: Padding(
        padding: Paddings.horizontal16,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            disabledHint: null,
            underline: null,
            borderRadius: BorderRadius.circular(6.r),
            isExpanded: true,
            value: drowDownValue,
            icon: Image.asset(IconAssets.arrowDown),
            items: items,
            onChanged: (String? newValue) {
              setState(() {
                drowDownValue = newValue!;
              });
            },
          ),
        ),
      ),
    );
  }
}
