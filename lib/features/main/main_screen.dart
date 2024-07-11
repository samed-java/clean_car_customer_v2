import 'dart:convert';

import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/branches_screen.dart';
import 'package:clean_car_customer_v2/features/home/home_screen.dart';
import 'package:clean_car_customer_v2/features/offers/offers_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/profile/profile_screen.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/services/firebase/fcm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../locator.dart';
import '../../utils/services/firebase/analytics/analytic_logger.dart';
import '../../utils/services/firebase/analytics/event.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    FCMProvider.onInitMessageOpenRoute((message) {
      if (message.data.isNotEmpty) {
        if (message.data["data"] != null) {
          Map<String, dynamic> data =
              json.decode(message.data["data"]) as Map<String, dynamic>;
          if (data["type"] == "rating") {
            Go.to(Pager.rating(
                reservationId: data["reservation_id"].toString(),
                branch: data["branch"].toString(),
                service: data["service"].toString())); // }
          }
        }
      }
    });
    FCMProvider.onMessageOpenRoute((message) {
      if (message.data.isNotEmpty) {
        if (message.data["data"] != null) {
          Map<String, dynamic> data =
              json.decode(message.data["data"]) as Map<String, dynamic>;
          if (data["type"] == "rating") {
            Go.to(Pager.rating(
                reservationId: data["reservation_id"].toString(),
                branch: data["branch"].toString(),
                service: data["service"].toString())); // }
          }
        }
      }
    });
    FCMProvider.onMessageRoute((message) {
      if (message.data.isNotEmpty) {
        if (message.data["data"] != null) {
          Map<String, dynamic> data =
              json.decode(message.data["data"]) as Map<String, dynamic>;
          if (data["type"] == "rating") {
            Go.to(Pager.rating(
                reservationId: data["reservation_id"].toString(),
                branch: data["branch"].toString(),
                service: data["service"].toString())); // }
          }
        }
      }
    });
    super.initState();

    // Timer(Duration(seconds: 3), () {
    //   Go.to(Pager.rating('733'));
    // });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final isBig = maxHeight > 1000;
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomeScreen(
            pageController: _pageController,
          ),
          const BranchesScreen(),
          const OffersScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8.0,
        child: SizedBox(
          height: isBig ? 120 : 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTabItem(0, IconAssets.home, context.locale.homepage),
              buildTabItem(1, IconAssets.map, context.locale.branches),
              FloatingActionButton(
                onPressed: () {
                  locator.get<EventLogger>().logEvent(event: Event.go_to_reservation);
                  Go.to(Pager.reservation());
                },
                elevation: 0,
                focusElevation: 0,
                hoverElevation: 0,
                backgroundColor: ColorManager.mainBlue,
                child: SvgPicture.asset(IconAssets.plus),
              ),
              buildTabItem(2, IconAssets.starFill, context.locale.offers),
              buildTabItem(3, IconAssets.profile, context.locale.myaccount),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabItem(int index, String icon, String label) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      },
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                _currentIndex == index
                    ? ColorManager.mainBlack
                    : ColorManager.fourthBlack,
                BlendMode.srcIn,
              ),
            ),
            // Text(
            //   label,
            //   style: TextStyle(
            //     color: _currentIndex == index
            //         ? ColorManager.mainBlack
            //         : ColorManager.thirdBlack,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
