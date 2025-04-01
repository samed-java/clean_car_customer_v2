import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CampaignBranchesSheet {
  static void showCampaignBranches({
    required Function() reserveAction,
  }) async {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: RadiusManager.radiusCircular16,
                topRight: RadiusManager.radiusCircular16)),
        backgroundColor: ColorManager.mainBackgroundColor,
        context: NavigationService.instance.context,
        builder: (context) {
          return _CampaignBranchesContent(
            reserveAction: reserveAction,
          );
        });
  }
}

class _CampaignBranchesContent extends StatelessWidget {
  const _CampaignBranchesContent({
    required this.reserveAction,
  });
  final Function() reserveAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: Paddings.all16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.locale.branches,
                  style: getSemiBoldStyle(
                      color: ColorManager.mainBlue, fontSize: FontSize.s18),
                ),
                Bounce(
                  duration: DurationConstant.ms100,
                  onPressed: () => Go.back(),
                  child: Icon(
                    Icons.close,
                    color: ColorManager.mainBlack,
                    size: 20.sp,
                  ),
                )
              ],
            ),
            16.verticalSpace,
            Container(
              padding: Paddings.all8,
              constraints: BoxConstraints(maxHeight: 600.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  RadiusManager.radiusCircular6,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 1.sw,
                      child: CustomSearchBar(
                        focusNode: FocusNode(),
                        hintText: 'context.locale.search',
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: _BranchItem(
                            branch: DummyBranch(
                              id: '1',
                              title: 'Branch 1',
                              distance: '2 km',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            16.verticalSpace,
            CustomButton(
              frontText: context.locale.makereservation,
              onPressed: reserveAction,
            )
          ],
        ),
      ),
    );
  }
}

class _BranchItem extends StatelessWidget {
  const _BranchItem({required this.branch});

  final DummyBranch branch;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.mainWhite,
        borderRadius: BorderRadius.all(RadiusManager.radiusCircular6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: ColorManager.mainBackgroundColor,
              child: SvgPicture.asset(
                IconAssets.location,
                height: 24.h,
                width: 24.w,
              ),
            ),
            8.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  branch.title,
                  overflow: TextOverflow.ellipsis,
                  style: getUnderlineStyle(
                    color: ColorManager.mainBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s14,
                  ),
                ),
                Text(
                  branch.distance,
                  overflow: TextOverflow.ellipsis,
                  style: getMediumStyle(
                    color: ColorManager.thirdBlack,
                    fontSize: FontSize.s12,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DummyBranch {
  final String id;
  final String title;
  final String distance;

  DummyBranch({
    required this.id,
    required this.title,
    required this.distance,
  });
}
