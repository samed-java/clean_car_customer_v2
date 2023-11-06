// import 'package:coinbud/components/custom_button.dart';
// import 'package:coinbud/components/global_text_field.dart';
// import 'package:coinbud/components/sheer_back_button.dart';
// import 'package:coinbud/constants/res/resources_export.dart';
// import 'package:coinbud/utils/enum/input_types.dart';
// import 'package:coinbud/utils/pager/go.dart';
// import 'package:coinbud/utils/services/navigation_service/navigation_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../components/custom_cancel_button.dart';
//
// class Snacks {
//   Snacks._();
//
//   static void showCustomSnack({required String message, bool isSucces = true}) {
//     ScaffoldMessenger.of(NavigationService.instance.context)
//         .showSnackBar(SnackBar(
//       content: SizedBox(
//         height: 32.h,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.info,
//               color: ColorManager.neuturals8,
//               size: 16.sp,
//             ),
//             Gaps.w8,
//             Text(
//               message,
//               style: getRegularStyle(color: ColorManager.neuturals8),
//             )
//           ],
//         ),
//       ),
//       margin: Paddings.all32,
//       // width: 331.w,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(RadiusManager.radiusCircular8)),
//       duration: DurationConstant.s3,
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: isSucces ? ColorManager.primary4 : ColorManager.primary3,
//     ));
//   }
// }
