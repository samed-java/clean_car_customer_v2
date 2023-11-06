import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../snacks/snacks.dart';

extension ControllerExtension on TextEditingController {
  bool get controllerIsEmpty => text.isEmpty;

  String? get textOrNULL => text.isEmpty ? null : text;

  void copyText() {
    Clipboard.setData(ClipboardData(text: text));
    // Snacks.showCustomSnack(message: "Copied");
  }

  void pasteText() async {
    ClipboardData? cText = await Clipboard.getData(Clipboard.kTextPlain);
    text = cText?.text ?? '';
  }

  // String? matchPasswords(TextEditingController controller){
  //   if(text.isNotEmpty && controller.text.isNotEmpty){
  //     if(text != controller.text){
  //       return "Passwords not match";
  //     }
  //   }else{
  //     if (text.isValidPassword ) {
  //       return null;
  //     } else {
  //       return "Your password is not match with conditions";
  //     }
  //   }
  // }

}
