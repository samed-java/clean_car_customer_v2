import 'package:clean_car_customer_v2/components/offer_card.dart';
import 'package:clean_car_customer_v2/constants/res/asset_manager.dart';
import 'package:clean_car_customer_v2/constants/res/color_manager.dart';
import 'package:clean_car_customer_v2/constants/res/gaps.dart';
import 'package:clean_car_customer_v2/constants/res/paddings.dart';
import 'package:clean_car_customer_v2/constants/res/styles_manager.dart';
import 'package:clean_car_customer_v2/features/home/cubit/home_cubit.dart';
import 'package:clean_car_customer_v2/features/home/widgets/banner.dart';
import 'package:clean_car_customer_v2/features/home/widgets/evacuator_ad_widget.dart';
import 'package:clean_car_customer_v2/features/home/widgets/filter_dialog.dart';
import 'package:clean_car_customer_v2/features/home/widgets/branch_card.dart';
import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/components/custom_filter_button.dart';
import 'package:clean_car_customer_v2/features/home/widgets/text_widget.dart';
import 'package:clean_car_customer_v2/features/offers/cubit/offers_cubit.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_notification_button.dart';

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
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<HomeCubit>().execute();
            context.read<OffersCubit>().execute();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              width: 1.sw,
              // height:MediaQuery.of(context).size.height * ((772-kToolbarHeight-MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom) / 812),
              child: Column(
                children: [
                  Gaps.h16,
                  Padding(
                    padding: Paddings.horizontal16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(ImageAssets.logo,width: 20,height: 20,),
                        NotificationButton(
                          onPressed: () {
                            Go.to(Pager.notifications);
                          },
                        ),
                      ],
                    ),
                  ),
                  // if (_focusNode.hasFocus)
                  //   SingleChildScrollView(
                  //     physics: const BouncingScrollPhysics(),
                  //     child: Container(
                  //       // height: 100.h,
                  //       width: double.infinity,
                  //       color: ColorManager.mainWhite,
                  //     ),
                  //   )
                  // else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          headerText: context.locale.centersnearyou,
                          buttonText: context.locale.all,
                          textStyle: getUnderlineStyle(
                              color: ColorManager.mainBlue, fontSize: 16),
                        ),
                      ),
                      Gaps.h10,
                      SizedBox(
                        height: 160.h,
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            if (state is HomeSuccess) {
                              //state.data.washings.length;
                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: context
                                    .read<HomeCubit>()
                                    .mainResult!
                                    .washings!
                                    .length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: BranchCard(
                                      model: context
                                          .read<HomeCubit>()
                                          .mainResult!
                                          .washings![index],
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
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            // widget.onPageChanged?.call(1);
                          },
                          headerText: "7/24",
                          buttonText: context.locale.all,
                          textStyle: getUnderlineStyle(
                              color: ColorManager.mainBlue, fontSize: 16),
                        ),
                      ),
                      Gaps.h10,
                      SizedBox(
                        height: 160.h,
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            if (state is HomeSuccess) {
                              //state.data.washings.length;
                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: context
                                    .read<HomeCubit>()
                                    .mainResult!
                                    .fullTimeWashings!
                                    .length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: BranchCard(
                                      model: context
                                          .read<HomeCubit>()
                                          .mainResult!
                                          .fullTimeWashings![index],
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
                        child: Text(
                          "Reklamlar",
                          style: getMediumStyle(
                              color: ColorManager.mainBlack, fontSize: 18),
                        ),
                      ),
                      Gaps.h10,
                      SizedBox(
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            if (state is HomeSuccess) {
                              //state.data.washings.length;
                              return BannerWidget(banners: context.read<HomeCubit>().mainResult!.banners!,);
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
                      const EvacuatorAdWidget(),
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
                          buttonText: context.locale.all,
                          headerText: context.locale.latestoffers,
                          textStyle: getUnderlineStyle(
                              color: ColorManager.mainBlue, fontSize: 16),
                        ),
                      ),
                      Gaps.h10,
                      Padding(
                        padding: Paddings.horizontal16,
                        child: BlocBuilder<OffersCubit, OffersState>(
                          builder: (context, state) {
                            if (state is OffersSuccess) {
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.data.offers.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
