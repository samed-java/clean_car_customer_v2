import 'dart:async';
import 'package:clean_car_customer_v2/constants/res/color_manager.dart';
import 'package:clean_car_customer_v2/features/splash/widgets/splash_begin_animated_icon.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/pager/transition.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/analytics/analytic_logger.dart';
import 'package:flutter/material.dart';

import '../../data/services/local/storage_service.dart';
import '../../locator.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class SplashBeginScreen extends StatefulWidget {
  const SplashBeginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashBeginScreen> createState() => _SplashBeginScreenState();
}

class _SplashBeginScreenState extends State<SplashBeginScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), () {
      if (locator.get<StorageService>().getAccessToken() != null) {
        locator.get<EventLogger>().logOpenApp(data: {
          "logged_in":true
        });
        PageTransitionUtils.navigateWithFadeOutTransition(context, Pager.main);
      } else {
        locator.get<EventLogger>().logOpenApp(data: {
          "logged_in":false
        });
        PageTransitionUtils.navigateWithFadeOutTransition(context, Pager.login);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBackgroundColor,
      body: const Stack(
        children: [
          SplashBeginAnimatedIcon(),
        ],
      ),
      //),
    );
  }
}
