import 'package:clean_car_customer_v2/components/offer_card.dart';
import 'package:clean_car_customer_v2/constants/res/color_manager.dart';
import 'package:clean_car_customer_v2/constants/res/gaps.dart';
import 'package:clean_car_customer_v2/constants/res/paddings.dart';
import 'package:clean_car_customer_v2/constants/res/styles_manager.dart';
import 'package:clean_car_customer_v2/features/home/cubit/home_cubit.dart';
import 'package:clean_car_customer_v2/features/home/widgets/filter_dialog.dart';
import 'package:clean_car_customer_v2/features/home/widgets/branch_card.dart';
import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/components/custom_filter_button.dart';
import 'package:clean_car_customer_v2/features/home/widgets/text_widget.dart';
import 'package:clean_car_customer_v2/features/offers/cubit/offers_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  final PageController? pageController;
  const HomeScreen({super.key, this.pageController});

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
                      openHomeFilterBox(context, height);
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
                        onPressed: () {
                          widget.pageController?.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          // widget.onPageChanged?.call(1);
                        },
                        headerText: "Sizə yaxın mərkəzlər",
                        buttonText: "hamısı",
                        textStyle: getRegularStyle(
                            color: ColorManager.mainBlue, fontSize: 16),
                      ),
                    ),
                    Gaps.h10,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * (160 / 816),
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          if (state is HomeSuccess) {
                            state.data.washings.length;
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.data.washings.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: BranchCard(
                                    model: state.data.washings[index],
                                  ),
                                );
                              },
                            );
                          } else if (state is HomeLoading) {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          } else if (state is HomeFail) {
                            return Center(
                              child: Text(state.message),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    Gaps.h16,
                    Padding(
                      padding: Paddings.horizontal16,
                      child: TextWidget(
                        onPressed: () {
                          widget.pageController?.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
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
                              BlocBuilder<OffersCubit, OffersState>(
                                builder: (context, state) {
                                  if (state is OffersSuccess) {
                                    return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: state.data.offers.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 12),
                                          child: OfferCard(
                                              offer: state.data.offers[index]),
                                        );
                                      },
                                    );
                                  } else if (state is OffersLoading) {
                                    return const Center(
                                        child: CupertinoActivityIndicator());
                                  } else if (state is OffersFail) {
                                    return Center(
                                      child: Text(state.message ?? ''),
                                    );
                                  }
                                  return const SizedBox.shrink();
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
