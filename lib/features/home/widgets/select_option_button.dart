import 'package:clean_car_customer_v2/constants/res/asset_manager.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({super.key});

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          cursorColor: Colors.black, // Change to your color
          onChanged: (value) {},
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(8),
            filled: true,
            fillColor: Colors.white, // Change to your color
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: InkWell(
              onTap: () {
                showOptions(context);
              },
              child: Image.asset(IconAssets.arrowDown)),
        ),
      ],
    );
  }

  void showOptions(BuildContext context) async {
    // List of options
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];

    String? selectedOption = await showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(0, 0, 0, 0),
      items: options.map((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );

    if (selectedOption != null) {
      // print('Selected option: $selectedOption');
    }
  }
}
