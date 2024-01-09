import 'package:flutter/cupertino.dart';

import '../services/navigation_service/navigation_service.dart';

class Go {
  Go._();
  static BuildContext get _context => NavigationService.instance.context;

  static Future to(Widget widget) {
    return Navigator.push(_context, CupertinoPageRoute(builder: (context) => widget));
  }

  static replaceAndGo(Widget widget) {
    Navigator.pushReplacement(
        _context, CupertinoPageRoute(builder: (context) => widget));
  }

  static removeUntillAndGo(Widget widget) {
    Navigator.pushAndRemoveUntil(_context,
        CupertinoPageRoute(builder: (context) => widget), (route) => false);
  }

  static back() {
    Navigator.pop(_context);
  }

  static removeUntillAndBack() {
    Navigator.popUntil(_context, (route) => false);
  }

  static canBack() {
    Navigator.canPop(_context);
  }

  static maybeBack() {
    Navigator.maybePop(_context);
  }
}
