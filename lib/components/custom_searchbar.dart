import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar(
      {super.key,
      required this.focusNode,
      this.searchController,
      this.onSubmit,
      this.onChange,
      this.onPressed,
      this.asButton = false, this.width});
  final TextEditingController? searchController;
  final FocusNode focusNode;
  final Function? onSubmit;
  final Function(String)? onChange;
  final Function? onPressed;
  final bool asButton;
  final double? width;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final ValueNotifier<bool> isBack = ValueNotifier<bool>(false);

  @override
  void initState() {
    widget.focusNode.addListener((){
      if(widget.focusNode.hasFocus){
        isBack.value = true;
      }
    });
    super.initState();
  }

  // final Function onFocusChanged;
  @override
  Widget build(BuildContext context) {
    double width = this.widget.width??MediaQuery.of(context).size.width * (280 / 375);
    return SizedBox(
      height: 40.h,
      width: width,
      child: ValueListenableBuilder(
        valueListenable: isBack,
        builder: (context, value, child) {
          return TextField(
            controller: widget.searchController,
            focusNode: widget.focusNode,
            onTap: () {
              // if (searchController.text.isEmpty) {
              //   onFocusChanged();
              // }
              // isBack.value = !isBack.value;
              // if (focusNode.hasFocus) {}
              if (!widget.asButton) {
                isBack.value = true;
              } else {
                widget.onPressed?.call();
              }
            },
            onChanged: widget.onChange,
            cursorColor: ColorManager.thirdBlack,
            decoration: InputDecoration(
              prefixIcon: value
                  ? IconButton(
                      onPressed: () {
                        widget.searchController?.clear();
                        widget.focusNode.unfocus();
                        widget.onSubmit?.call();
                        widget.onChange?.call(widget.searchController?.text ?? '');
                        SystemChannels.textInput.invokeMethod("TextInput.hide");
                        isBack.value = false;

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
            onSubmitted: (val) => widget.onSubmit?.call(),
            readOnly: widget.asButton,
          );
        },
      ),
    );
  }
}
