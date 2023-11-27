import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_dots.dart';
import 'package:clean_car_customer_v2/components/custom_text_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/onboadding_and_sign_up/onboarding/widgets/build_onboarding.dart';
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
  double _containerHeight = 700.h;
  double _containerRadius = 32.r;

  @override
  Widget build(BuildContext context) {
    final double maxSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _containerHeight,
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
                        headerText: "Yaxın ərazi!!!",
                        subText:
                            "Sizə ən yaxın ərazidə yerləşən avtomobil yuma mərkəzlərini bir mobil tətbiqdə cəmlədik",
                      ),
                      BuildOnboardingPage(
                        svgAsset: ImageAssets.onboarding2,
                        headerText: "Üstün keyfiyyət!!!",
                        subText:
                            "Sizi və avtomobilinizi düşünərək yüksək keyfiyyətli xidmətlər təklif edirik",
                      ),
                      BuildOnboardingPage(
                        svgAsset: ImageAssets.onboarding3,
                        headerText: "Rezervasiya imkanı!!!",
                        subText:
                            "Avtomobiliniz üçün seçdiyiniz istənilən xidməti öncədən rezerv edin",
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
                          frontText: "Başla",
                          onPressed: () {
                            Go.removeUntillAndGo(Pager.signup);
                          },
                        ),
                      ),
                Gaps.h64,
              ],
            ),
          ),

          // bura alt terefdi
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
                            text: "Keç",
                            color: ColorManager.mainWhite,
                            onPressed: () {
                              Go.removeUntillAndGo(Pager.signup);
                            },
                          ),
                          CustomTextButton(
                            text: "Növbəti",
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
      backgroundColor: ColorManager.mainBlue,
    );
  }
}
