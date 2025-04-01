import 'package:clean_car_customer_v2/constants/res/font_manager.dart';
import 'package:clean_car_customer_v2/features/campaigns/widget/campaign_tile.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/res/asset_manager.dart';
import '../../constants/res/color_manager.dart';
import '../../constants/res/gaps.dart';
import '../../constants/res/paddings.dart';
import '../../constants/res/styles_manager.dart';
import '../../utils/pager/go.dart';
import 'cubit/campaigns_cubit.dart';

class CampaignPage extends StatelessWidget {
  const CampaignPage({super.key});

  final bool isReaden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBlue,
      body: SafeArea(
        top: true,
        bottom: false,
        left: true,
        right: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 20.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Go.back();
                    },
                    child: SizedBox(
                      height: 32.h,
                      width: 32.w,
                      child: Padding(
                        padding: Paddings.all8,
                        child: SvgPicture.asset(
                          IconAssets.backButton2,
                          colorFilter: ColorFilter.mode(
                              ColorManager.mainWhite, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  Gaps.w4,
                  Text(
                    context.locale.campaigns, //context.locale.notifications,
                    style: getSemiBoldStyle(
                      color: ColorManager.mainWhite,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  width: 1.sw,
                  // height: MediaQuery.of(context).size.height * (712 / 816),
                  decoration: BoxDecoration(
                    color: ColorManager.mainBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Padding(
                      padding: Paddings.all16,
                      child: BlocBuilder<CampaignsCubit, CampaignsState>(
                        builder: (context, state) {
                          if (state is CampaignsSuccess) {
                            return RefreshIndicator(
                              onRefresh: () async {
                                context.read<CampaignsCubit>().execute();
                              },
                              child: ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                separatorBuilder: (_, __) => 16.verticalSpace,
                                itemBuilder: (_, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.data.campaigns
                                                ?.elementAt(index)
                                                .date
                                                .toString() ??
                                            '',
                                        style: getMediumStyle(
                                            color: ColorManager.secondaryBlack,
                                            fontSize: FontSize.s14),
                                      ),
                                      8.horizontalSpace,
                                      ...state.data.campaigns!
                                          .elementAt(index)
                                          .campaign!
                                          .map((e) => CampaignTile(
                                                isReaden: false,
                                                data: e,
                                              ))
                                    ],
                                  );
                                },
                                itemCount: state.data.campaigns!.length,
                              ),
                            );
                          } else if (state is CampaignsLoading) {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          } else if (state is CampaignsFail) {
                            return Center(
                              child: Text(state.message ?? ''),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
