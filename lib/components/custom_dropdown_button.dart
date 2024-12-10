import 'package:animate_do/animate_do.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown({
    super.key,
    this.selectedItems,
    this.validator,
    this.items,
    this.labelText,
    required this.onChanged,
    required this.child,
    this.errorText,
  }) : title = null;

  const CustomDropdown.withTitle({
    super.key,
    this.selectedItems,
    this.items,
    this.labelText,
    required this.onChanged,
    required this.child,
    required this.title,
    this.errorText,
    this.validator,
  });

  final T? selectedItems;
  final Map<T, dynamic>? items;
  final String? labelText;
  final ValueChanged<T?> onChanged;
  final Widget Function(dynamic) child;
  final String? Function(T?)? validator;
  final String? title;
  final String? errorText;

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? _selectedItems;
  String? errorText;

  @override
  void initState() {
    super.initState();
    print("initial id ${widget.selectedItems}");
    _changeSelectItems(widget.selectedItems);
    errorText = widget.errorText;
  }

  void _changeSelectItems(T? data) {
    widget.onChanged.call(data);
    _selectedItems = data;
  }

  @override
  void didUpdateWidget(covariant CustomDropdown<T> oldWidget) {
    _changeSelectItems(widget.selectedItems);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 48,
          padding: Paddings.horizontal8,
          //alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ColorManager.mainWhite,
              borderRadius: BorderRadius.all(RadiusManager.radiusCircular4)),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<T>(
              validator: (value) {
                setState(() {
                  errorText = widget.validator?.call(value);
                });
                return errorText;
              },
              isDense: true,
              value:
                  widget.items?.isNotEmpty ?? false ? _selectedItems : null,
              onChanged: _changeSelectItems,
              // isExpanded: true,
              iconSize: 0,
              elevation: 0,
              borderRadius: BorderRadius.all(RadiusManager.radiusCircular4),
              dropdownColor: ColorManager.mainWhite,
              decoration: InputDecoration(
                  hintText: widget.labelText,
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,),
                  errorText: '',
                  errorStyle: const TextStyle(
                      color: Colors.transparent, fontSize: 0, height: 0),
                  errorBorder: InputBorder.none,
                  border: InputBorder.none),
              style: getMediumStyle(
                  color: ColorManager.mainBlack, fontSize: FontSize.s14),
              items: widget.items?.isNotEmpty ?? false
                  ? widget.items!.entries
                      .map((e) => DropdownMenuItem<T>(
                            value: e.key,
                            child: Container(
                              width: 220.w,
                              height: 60,
                              child: widget.child(e.value),
                            ),
                          ))
                      .toList()
                  : [],
            ),
          ),
        ),
        if (errorText != null) ...[
          4.verticalSpace,
          Padding(
            padding: Paddings.all4,
            child: FadeIn(
              child: Text(
                errorText!,
                style: getRegularStyle(color: ColorManager.mainRed),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
