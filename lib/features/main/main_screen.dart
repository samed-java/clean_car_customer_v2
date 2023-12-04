import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/branches/branches_screen.dart';
import 'package:clean_car_customer_v2/features/offers/offers_screen.dart';
import 'package:clean_car_customer_v2/features/home/home_screen.dart';
import 'package:clean_car_customer_v2/features/profile_section/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTabItem(0, IconAssets.home, "Ana səhifə"),
              buildTabItem(1, IconAssets.map, "Filiallar"),
              FloatingActionButton(
                onPressed: () {},
                elevation: 0,
                focusElevation: 0,
                hoverElevation: 0,
                backgroundColor: ColorManager.mainBlue,
                child: SvgPicture.asset(IconAssets.plus),
              ),
              buildTabItem(2, IconAssets.starFill, "Təkliflər"),
              buildTabItem(3, IconAssets.profile, "Hesabım"),
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
                  : ColorManager.thirdBlack,
              BlendMode.srcIn,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: _currentIndex == index
                  ? ColorManager.mainBlack
                  : ColorManager.thirdBlack,
            ),
          ),
        ],
      ),
    );
  }
}
