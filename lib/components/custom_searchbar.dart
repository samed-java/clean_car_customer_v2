import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    super.key,
    required this.focusNode,
    this.searchController,
    this.onSubmit,
    this.onPressed,
    this.asButton = false
  });
  final ValueNotifier<bool> isBack = ValueNotifier<bool>(false);
  final TextEditingController? searchController;
  final FocusNode focusNode;
  final Function? onSubmit;
  final Function? onPressed;
  final bool asButton;
  // final Function onFocusChanged;

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
              // if (searchController.text.isEmpty) {
              //   onFocusChanged();
              // }
              // isBack.value = !isBack.value;
              // if (focusNode.hasFocus) {}
              if(!asButton) {
                isBack.value = !isBack.value;
              }else{
                onPressed?.call();
              }
            },
            onChanged: (value) {
              // if (value.isNotEmpty) {
              //   isBack.value = true;
              // } else {
              //   isBack.value = false;
              // }
            },
            cursorColor: ColorManager.thirdBlack,
            decoration: InputDecoration(
              prefixIcon: value
                  ? IconButton(
                      onPressed: () {
                        searchController?.clear();
                        focusNode.unfocus();
                        onSubmit?.call();
                        SystemChannels.textInput.invokeMethod("TextInput.hide");
                        isBack.value = !isBack.value;

                        // onFocusChanged();
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
              hintText: context.locale.findacarwash,
              fillColor: ColorManager.mainWhite,

              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  RadiusManager.radiusCircular6,
                ),
              ),
            ),
            onSubmitted: (val)=>onSubmit?.call(),
            readOnly: asButton,
          );
        },
      ),
    );
  }
}
