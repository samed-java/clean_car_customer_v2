import 'package:clean_car_customer_v2/constants/res/color_manager.dart';
import 'package:clean_car_customer_v2/constants/res/gaps.dart';
import 'package:clean_car_customer_v2/constants/res/paddings.dart';
import 'package:clean_car_customer_v2/constants/res/styles_manager.dart';
import 'package:clean_car_customer_v2/features/home/widgets/filter_dialog.dart';
import 'package:clean_car_customer_v2/features/home/widgets/branch_card.dart';
import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/components/custom_filter_button.dart';
import 'package:clean_car_customer_v2/components/offer_card.dart';
import 'package:clean_car_customer_v2/features/home/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();
  // bool isSearchFocused = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 528 / 816;

    return Scaffold(
      backgroundColor: ColorManager.mainBackgroundColor,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Gaps.h16,
            Padding(
              padding: Paddings.horizontal16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSearchBar(
                    // onFocusChanged: () {
                    // setState(() {
                    //   isSearchFocused = !isSearchFocused;
                    // });
                    // },
                    focusNode: _focusNode,
                  ),
                  FilterButton(
                    onPressed: () {
                      openFilterBox(context, height);
                    },
                  ),
                ],
              ),
            ),
            if (_focusNode.hasFocus)
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  // height: 100.h,
                  width: double.infinity,
                  color: ColorManager.mainWhite,
                ),
              )
            else
              Expanded(
                child: Column(
                  children: [
                    Gaps.h24,
                    Padding(
                      padding: Paddings.horizontal16,
                      child: TextWidget(
                        headerText: "Sizə yaxın mərkəzlər",
                        buttonText: "hamısı",
                        textStyle: getRegularStyle(
                            color: ColorManager.mainBlue, fontSize: 16),
                      ),
                    ),
                    Gaps.h10,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * (160 / 816),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: const BranchCard(),
                          );
                        },
                      ),
                    ),
                    Gaps.h16,
                    Padding(
                      padding: Paddings.horizontal16,
                      child: TextWidget(
                        buttonText: "hamısı",
                        headerText: "Ən son təkliflər",
                        textStyle: getUnderlineStyle(
                            color: ColorManager.mainBlue, fontSize: 16),
                      ),
                    ),
                    Gaps.h10,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: Paddings.horizontal16,
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (context, builder) {
                                  return const Padding(
                                    padding: EdgeInsets.only(bottom: 12),
                                    child: OfferCard(),
                                  );
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
          ],
        ),
      ),
    );
  }
}
