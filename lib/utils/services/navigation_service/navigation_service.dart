import 'package:flutter/material.dart';

class NavigationService{
  GlobalKey<NavigatorState>? navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService(){
    navigationKey = GlobalKey<NavigatorState>();
  }

  BuildContext get context => navigationKey!.currentContext!;
}

ThemeData get theme => Theme.of(NavigationService.instance.context);