import 'package:clean_car_customer_v2/constants/res/color_manager.dart';
import 'package:clean_car_customer_v2/constants/res/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentTextField extends StatefulWidget {
  const CommentTextField({super.key});

  @override
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 6, // Set to null for unlimited lines
      minLines: 4, // Set the minimum number of lines
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.mainWhite,
        hintStyle: getMediumStyle(color: ColorManager.fifthBlack, fontSize: 14),
        hintText: 'Rəy yaz...',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
    );
  }
}
