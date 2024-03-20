import 'package:flutter/material.dart';

class PageTransitionUtils {
  static void navigateWithFadeInTransition(
      BuildContext context, Widget destination) {
    Navigator.pushAndRemoveUntil(
      context,
      _fadeRouteBuilder(destination),
      (route) => false,
    );
  }
  static void navigateFadeInTransition(
      BuildContext context, Widget destination) {
    Navigator.push(
      context,
      _fadeRouteBuilder(destination),
    );
  }

  static void navigateWithFadeOutTransition(
      BuildContext context, Widget destination) {
    Navigator.pushAndRemoveUntil(
      context,
      _fadeRouteBuilder(destination),
      (route) => false,
    );
  }

  static PageRouteBuilder _fadeRouteBuilder(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var opacityAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
    );
  }
}
