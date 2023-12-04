import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Paddings {
  static EdgeInsets bottom16 = EdgeInsets.only(bottom: 16.h);

  Paddings._();

  static EdgeInsets horizontal2 = EdgeInsets.symmetric(horizontal: 2.w);
  static EdgeInsets horizontal4 = EdgeInsets.symmetric(horizontal: 4.w);
  static EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets horizontal10 = EdgeInsets.symmetric(horizontal: 10.w);
  static EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets horizontal20 = EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsets horizontal32 = EdgeInsets.symmetric(horizontal: 32.w);
  static EdgeInsets horizontal64 = EdgeInsets.symmetric(horizontal: 64.w);
  static EdgeInsets horizontal24 = EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets horizontal48 = EdgeInsets.symmetric(horizontal: 48.w);

  static EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets vertical6 = EdgeInsets.symmetric(vertical: 6.h);
  static EdgeInsets vertical4 = EdgeInsets.symmetric(vertical: 4.h);

  static EdgeInsets horizontal24vertical16 =
      EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h);

  static EdgeInsets all16 = EdgeInsets.all(16.w);
  static EdgeInsets all12 = EdgeInsets.all(12.w);
  static EdgeInsets all24 = EdgeInsets.all(24.w);
  static EdgeInsets all32 = EdgeInsets.all(32.w);

  static EdgeInsets all10 =
      EdgeInsets.only(top: 10.w, bottom: 10.w, left: 10.w, right: 10.w);
  static EdgeInsets all8 =
      EdgeInsets.only(top: 8.w, bottom: 8.w, left: 8.w, right: 8.w);

  static EdgeInsets all6 =
      EdgeInsets.only(top: 6.w, bottom: 6.w, left: 6.w, right: 6.w);

  static EdgeInsets all4 =
      EdgeInsets.only(top: 4.w, bottom: 4.w, left: 4.w, right: 4.w);
}
