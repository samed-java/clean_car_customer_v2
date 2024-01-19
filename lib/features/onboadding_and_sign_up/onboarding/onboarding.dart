import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_dots.dart';
import 'package:clean_car_customer_v2/components/custom_text_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/onboarding/widgets/build_onboarding.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  double _containerRadius = 32.r;
  double _containerHeight = 680.h;

  @override
  Widget build(BuildContext context) {
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;
    double topSafeAreaHeight = safeAreaPadding.top;
    final double maxSize =
        MediaQuery.of(context).size.height - topSafeAreaHeight;
    // bottomSafeAreaHeight;
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: _containerHeight + topSafeAreaHeight,
              decoration: BoxDecoration(
                color: ColorManager.mainBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(_containerRadius),
                  bottomRight: Radius.circular(_containerRadius),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: topSafeAreaHeight,
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                        if (_currentPage == 2) {
                          _containerHeight = maxSize;
                          _containerRadius = 0;
                        }
                      },
                      physics: (_currentPage == 2)
                          ? const NeverScrollableScrollPhysics()
                          : const AlwaysScrollableScrollPhysics(),
                      children: [
                        BuildOnboardingPage(
                          svgAsset: ImageAssets.onboarding1,
                          headerText: "${context.locale.area}!!!",
                          subText: context.locale.onboardfirsttext,
                        ),
                        BuildOnboardingPage(
                          svgAsset: ImageAssets.onboarding2,
                          headerText: "${context.locale.superquality}!!",
                          subText: context.locale.onboardsecondtext,
                        ),
                        BuildOnboardingPage(
                          svgAsset: ImageAssets.onboarding3,
                          headerText:
                              "${context.locale.possibilityofreservation}!!",
                          subText: context.locale.onboardthirdtext,
                        ),
                      ],
                    ),
                  ),
                  _currentPage != 2
                      ? CustomDots(
                          currentPage: _currentPage,
                          number: 3,
                        )
                      : Padding(
                          padding: Paddings.horizontal16,
                          child: CustomButton(
                            frontText: context.locale.start,
                            onPressed: () {
                              Go.removeUntillAndGo(Pager.signup);
                            },
                          ),
                        ),
                  Gaps.h64,
                ],
              ),
            ),
            _currentPage == 2
                ? Gaps.empty
                : Expanded(
                    child: Center(
                      child: Padding(
                        padding: Paddings.horizontal16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextButton(
                              text: context.locale.pass,
                              color: ColorManager.mainWhite,
                              onPressed: () {
                                Go.removeUntillAndGo(Pager.signup);
                              },
                            ),
                            CustomTextButton(
                              text: context.locale.next,
                              color: ColorManager.mainWhite,
                              onPressed: () {
                                if (_currentPage == 2) {
                                  setState(() {
                                    // _containerHeight = double.infinity;
                                  });
                                } else {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      backgroundColor: ColorManager.mainBlue,
    );
  }
}
