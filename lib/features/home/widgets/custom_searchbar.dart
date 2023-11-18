import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    super.key,
    required this.onFocusChanged,
  });
  final ValueNotifier<bool> isBack = ValueNotifier<bool>(false);
  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final VoidCallback onFocusChanged;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * (280 / 375);
    return SizedBox(
      height: 40.h,
      width: width,
      child: ValueListenableBuilder(
        valueListenable: isBack,
        builder: (context, value, child) {
          return TextField(
            controller: searchController,
            focusNode: focusNode,
            onTap: () {
              if (searchController.text.isEmpty) {
                onFocusChanged();
              }
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                isBack.value = true;
              } else {
                isBack.value = false;
              }
            },
            cursorColor: ColorManager.thirdBlack,
            decoration: InputDecoration(
              prefixIcon: value
                  ? IconButton(
                      onPressed: () {
                        searchController.clear();
                        isBack.value = false;
                        focusNode.unfocus();
                        onFocusChanged();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorManager.mainBlack,
                      ))
                  : Image.asset(
                      IconAssets.search2,
                      height: 16.h,
                      width: 16.w,
                    ),
              hintStyle:
                  getRegularStyle(color: ColorManager.fifthBlack, fontSize: 14),
              contentPadding: Paddings.horizontal16,
              hintText: "avtoyuma mərkəzi axtar",
              fillColor: ColorManager.mainWhite,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  RadiusManager.radiusCircular6,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
