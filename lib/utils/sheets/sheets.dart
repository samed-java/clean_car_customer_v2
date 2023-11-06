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
// class Sheets {
//   Sheets._();
//
//   static void showJoinSprintSheet({
//     required String text,
//     void Function()? onJoin,
//     void Function()? onCancel,
//   }) {
//     showModalBottomSheet(
//         isScrollControlled: true,
//         barrierColor: ColorManager.neuturals2.withOpacity(0.7),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: RadiusManager.radiusCircular20,
//                 topRight: RadiusManager.radiusCircular20)),
//         backgroundColor: ColorManager.neuturals1,
//         context: NavigationService.instance.context,
//         builder: (context) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Container(
//               height: 550.h,
//               padding: Paddings.all16,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CustomCancelIcon(
//                         onPressed: () {
//                           Go.back();
//                         },
//                       )
//                     ],
//                   ),
//                   Transform.translate(
//                     offset: Offset(-20, 0),
//                     child: Image.asset(ImageAssets.companyWelcome),
//                   ),
//                   Text(
//                     text,
//                     style: getMediumStyle(
//                         color: ColorManager.neuturals8,
//                         fontSize: FontSize.s20,
//                         fontFamily: FontConstant.fontFamilyPoppins),
//                   ),
//                   Gaps.h16,
//                   CustomButton(
//                       text: "Join",
//                       onTap: () {
//                         onJoin?.call();
//                         Go.back();
//                       }),
//                   Gaps.h16,
//                   CustomButton(
//                       text: "Cancel",
//                       hasBorder: true,
//                       onTap: () {
//                         onCancel?.call();
//                         Go.back();
//                       })
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   static void showDeleteSheet({
//     required String title,
//     String? subtitle,
//     void Function()? onDelete,
//     void Function()? onKeep,
//   }) {
//     showModalBottomSheet(
//         isScrollControlled: true,
//         barrierColor: ColorManager.neuturals2.withOpacity(0.7),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: RadiusManager.radiusCircular20,
//                 topRight: RadiusManager.radiusCircular20)),
//         backgroundColor: ColorManager.neuturals1,
//         context: NavigationService.instance.context,
//         builder: (context) {
//           return Container(
//             height: 400.h,
//             padding: Paddings.all16,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CustomCancelIcon(
//                       onPressed: () {
//                         Go.back();
//                       },
//                     ),
//                   ],
//                 ),
//                 Gaps.h32,
//                 Text(
//                   title,
//                   style: getSemiBoldStyle(
//                       color: ColorManager.neuturals8,
//                       fontSize: FontSize.s24,
//                       fontFamily: FontConstant.fontFamilyPoppins),
//                 ),
//                 Gaps.h16,
//                 if (subtitle != null)
//                   Text(
//                     subtitle,
//                     style: getMediumStyle(
//                         color: ColorManager.neuturals8,
//                         fontSize: FontSize.s14,
//                         fontFamily: FontConstant.fontFamilyPoppins),
//                   ),
//                 Spacer(),
//                 CustomButton(
//                     text: "Yes,delete",
//                     color: ColorManager.primary3,
//                     onTap: () {
//                       onDelete?.call();
//                       Go.back();
//                     }),
//                 Gaps.h16,
//                 CustomButton(
//                     text: "No,keep it",
//                     hasBorder: true,
//                     onTap: () {
//                       onKeep?.call();
//                       Go.back();
//                     })
//               ],
//             ),
//           );
//         });
//   }
//
//   static void showConnectMetamaskSheet({
//     void Function()? onConnect,
//     void Function()? onCopyPaste,
//     required bool Function(String?) onContinue,
//   }) {
//     showModalBottomSheet(
//         isScrollControlled: true,
//         barrierColor: ColorManager.neuturals2.withOpacity(0.7),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: RadiusManager.radiusCircular20,
//                 topRight: RadiusManager.radiusCircular20)),
//         backgroundColor: ColorManager.neuturals1,
//         context: NavigationService.instance.context,
//         builder: (context) {
//           return Container(
//             height: 550.h,
//             padding: Paddings.all16,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CustomCancelIcon(
//                       onPressed: () {
//                         Go.back();
//                       },
//                     ),
//                   ],
//                 ),
//                 Gaps.h32,
//                 Image.asset(ImageAssets.metamask),
//                 Spacer(),
//                 Text(
//                   "You need to connect your wallet first to start task",
//                   textAlign: TextAlign.center,
//                   style: getMediumStyle(
//                       color: ColorManager.neuturals8,
//                       fontSize: FontSize.s16,
//                       fontFamily: FontConstant.fontFamilyPoppins),
//                 ),
//                 Spacer(),
//                 CustomButton(
//                     text: "Connect Metamask wallet",
//                     onTap: () {
//                       onConnect?.call();
//                       Go.back();
//                     }),
//                 Text(
//                   "or",
//                   textAlign: TextAlign.center,
//                   style: getRegularStyle(
//                       color: ColorManager.neuturals4,
//                       fontSize: FontSize.s14,
//                       fontFamily: FontConstant.fontFamilyPoppins),
//                 ),
//                 CustomButton(
//                     text: "Copy paste token",
//                     hasBorder: true,
//                     onTap: () {
//                       onCopyPaste?.call();
//                       Go.back();
//                       showCopyPasteWalletSheet(onContinue: onContinue);
//                     })
//               ],
//             ),
//           );
//         });
//   }
//
//   static void showCongratsSheet({
//     void Function()? onTap,
//   }) {
//     showModalBottomSheet(
//         isScrollControlled: true,
//         barrierColor: ColorManager.neuturals2.withOpacity(0.7),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: RadiusManager.radiusCircular20,
//                 topRight: RadiusManager.radiusCircular20)),
//         backgroundColor: ColorManager.neuturals1,
//         context: NavigationService.instance.context,
//         builder: (context) {
//           return Container(
//             height: 400.h,
//             padding: Paddings.all16,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CustomCancelIcon(
//                       onPressed: () {
//                         Go.back();
//                       },
//                     )
//                   ],
//                 ),
//                 Gaps.h16,
//                 Image.asset(ImageAssets.popper),
//                 Gaps.h16,
//                 Text(
//                   "Congrats",
//                   style: getMediumStyle(
//                       color: ColorManager.neuturals8,
//                       fontSize: FontSize.s24,
//                       fontFamily: FontConstant.fontFamilyPoppins),
//                 ),
//                 // Gaps.h16,
//                 Text(
//                     'Lorem ipsum dolor sit amet consectetur. Turpis gravida amet scelerisque felis vitae sed.',
//                     textAlign: TextAlign.center,
//                     style: getRegularStyle(
//                         color: ColorManager.neuturals4,
//                         fontSize: FontSize.s14,
//                         fontFamily: FontConstant.fontFamilyPoppins)),
//                 Gaps.h16,
//                 CustomButton(
//                     text: "OK",
//                     onTap: () {
//                       onTap?.call();
//                       Go.back();
//                     }),
//                 Gaps.h16,
//               ],
//             ),
//           );
//         });
//   }
//
//   static void showDeleteAccountSheet({
//     required String title,
//     required bool Function(String?) onContinue,
//     String? subtitle,
//     void Function()? onDelete,
//     void Function()? onKeep,
//   }) {
//     TextEditingController controller = TextEditingController();
//
//     showModalBottomSheet(
//         isScrollControlled: true,
//         barrierColor: ColorManager.neuturals2.withOpacity(0.7),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: RadiusManager.radiusCircular20,
//                 topRight: RadiusManager.radiusCircular20)),
//         backgroundColor: ColorManager.neuturals1,
//         context: NavigationService.instance.context,
//         builder: (context) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(NavigationService.instance.context)
//                     .viewInsets
//                     .bottom),
//             child: Container(
//               height: 450.h,
//               padding: Paddings.all16,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CustomCancelIcon(
//                         onPressed: () {
//                           Go.back();
//                         },
//                       ),
//                     ],
//                   ),
//                   Gaps.h32,
//                   Text(
//                     title,
//                     style: getSemiBoldStyle(
//                         color: ColorManager.neuturals8,
//                         fontSize: FontSize.s24,
//                         fontFamily: FontConstant.fontFamilyPoppins),
//                   ),
//                   Gaps.h16,
//                   if (subtitle != null)
//                     Text(
//                       subtitle,
//                       style: getMediumStyle(
//                           color: ColorManager.neuturals8,
//                           fontSize: FontSize.s14,
//                           fontFamily: FontConstant.fontFamilyPoppins),
//                     ),
//                   Gaps.h32,
//                   GlobalTextField(
//                     title: "Password",
//                     hint: "",
//                     type: InputTypes.password,
//                     controller: controller,
//                   ),
//                   Spacer(),
//                   CustomButton(
//                       text: "Continue",
//                       onTap: () {
//                         bool isCorrect = onContinue.call(controller.text);
//                         if (isCorrect) {
//                           Go.back();
//                           showDeleteSheet(
//                               title: title,
//                               onDelete: onDelete,
//                               onKeep: onKeep,
//                               subtitle: subtitle);
//                         }
//                       })
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   static void showCopyPasteWalletSheet({
//     void Function()? onConnect,
//     void Function()? onCopyPaste,
//     required bool Function(String?) onContinue,
//   }) {
//     TextEditingController controller = TextEditingController();
//
//     showModalBottomSheet(
//         isScrollControlled: true,
//         barrierColor: ColorManager.neuturals2.withOpacity(0.7),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: RadiusManager.radiusCircular20,
//                 topRight: RadiusManager.radiusCircular20)),
//         backgroundColor: ColorManager.neuturals1,
//         context: NavigationService.instance.context,
//         builder: (context) {
//           return Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(NavigationService.instance.context)
//                     .viewInsets
//                     .bottom),
//             child: Container(
//               height: 550.h,
//               padding: Paddings.all16,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SheetBackButton(
//                         onPressed: () {
//                           Go.back();
//                           Sheets.showConnectMetamaskSheet(
//                               onContinue: onContinue,
//                               onConnect: onConnect,
//                               onCopyPaste: onCopyPaste);
//                         },
//                       ),
//                     ],
//                   ),
//                   Gaps.h32,
//                   Image.asset(ImageAssets.metamask),
//                   Spacer(),
//                   Text(
//                     "Copy and paste your Metamusk address",
//                     textAlign: TextAlign.center,
//                     style: getMediumStyle(
//                         color: ColorManager.neuturals8,
//                         fontSize: FontSize.s16,
//                         fontFamily: FontConstant.fontFamilyPoppins),
//                   ),
//                   Spacer(),
//                   GlobalTextField(
//                     title: "Wallet address",
//                     hint: "Paste here",
//                     type: InputTypes.text,
//                     controller: controller,
//                   ),
//                   Spacer(),
//                   CustomButton(
//                       text: "Confirm",
//                       onTap: () {
//                         bool isCorrect = onContinue.call(controller.text);
//                         if (isCorrect) {
//                           Go.back();
//                         }
//                       })
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
