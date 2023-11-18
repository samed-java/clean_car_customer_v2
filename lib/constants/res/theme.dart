// import 'package:clean_car_customer_v2/constants/res/styles_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // colors of the app
    primaryColor: ColorManager.mainBlue, // 1

    fontFamily: FontConstant.fontFamilyPoppins, // bura poppins olacaq
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    // unselectedLabelStyle: getRegularStyle(color: ColorManager.neuturals4),
    // selectedLabelStyle: getRegularStyle(color: ColorManager.primary2),
    // backgroundColor: ColorManager.neuturals1,
    // selectedItemColor: ColorManager.primary2,
    // unselectedItemColor: ColorManager.neuturals4,
    // ),
    scaffoldBackgroundColor: ColorManager.mainBackgroundColor, // 2
    //primaryColorLight: ColorManager.primaryOpacity70,
    //primaryColorDark: ColorManager.darkPrimary,
    // disabledColor: ColorManager
    // .neuturals2,
    //will be used incase of disabled button for example
    // splashColor: ColorManager.neuturals1,
    //accentColor: ColorManager.grey,

    //card view theme

    // appBarTheme: AppBarTheme(
    //     centerTitle: true,
    //     color: ColorManager.neuturals1,
    //     //elevation: AppSize.s4,
    //     //shadowColor: ColorManager.primaryOpacity70,
    //     titleTextStyle: TextStyle(
    //         color: ColorManager.neuturals8,
    //         fontSize: FontSize.s24,
    //         fontWeight: FontWeightManager.bold)),

    // //button theme
    // buttonTheme: ButtonThemeData(
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(RadiusManager.radiusCircular90)),
    //   disabledColor: ColorManager.primary1.withOpacity(0.5),
    //   buttonColor: ColorManager.primary1,
    // ), //splashColor: ColorManager.primaryOpacity70),
    //elevated button theme
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         textStyle: getRegularStyle(color: ColorManager.white),
    //         backgroundColor: ColorManager.redAll,
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(AppSize.s12)))),

    // Text theme
    // textTheme: TextTheme(
    //     displayLarge: TextStyle(
    //         fontSize: fontSize,
    //         fontFamily: fontFamily,
    //         color: color,
    //         fontWeight: fontWeight))

    // input decaration theme (text form field
    //inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.all(AppPadding.p8),
    //
    //   //hint style
    //   hintStyle: getRegularStyle(color: ColorManager.grey1),
    //
    //   // label style
    //   labelStyle: getMediumStyle(color: ColorManager.darkGrey),
    //
    //   // error style
    //   errorStyle: getRegularStyle(color: ColorManager.red),
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(
    //         color: ColorManager.inputBorderColor, width: AppSize.s1_5),
    //     // borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
    //   ),

    // focus border
    // focusedBorder: OutlineInputBorder(
    //   borderSide:
    //       BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //   borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
    // ),
    //
    // // error border
    // errorBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: ColorManager.red, width: AppSize.s1_5),
    //   borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
    // ),
    //
    // // focused error border
    // focusedErrorBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: ColorManager.red, width: AppSize.s1_5),
    //   borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
    // ),
  );
}
