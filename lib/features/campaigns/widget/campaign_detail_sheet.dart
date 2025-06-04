import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CampaignDetailSheet {
  static void showCampaignDetail({
    required String title,
    required String content,
    required Function() reserveAction,
    required Function() showBranches,
    String? endDate,
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
          return _CampaignDetailContent(
            title: title,
            content: content,
            endDate: endDate,
            reserveAction: reserveAction,
            showBranches: showBranches,
          );
        });
  }
}

class _CampaignDetailContent extends StatelessWidget {
  const _CampaignDetailContent({
    required this.title,
    required this.content,
    required this.reserveAction,
    required this.showBranches,
    this.endDate,
  });
  final String title;
  final String content;
  final String? endDate;
  final Function() reserveAction;
  final Function() showBranches;

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
                  context.locale.detailed,
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
                  color: ColorManager.mainWhite,
                  borderRadius:
                      BorderRadius.all(RadiusManager.radiusCircular6)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 1.sw,
                      child: Text(
                        title,
                        style: getMediumStyle(
                            color: ColorManager.mainBlack,
                            fontSize: FontSize.s14),
                      ),
                    ),
                    8.verticalSpace,
                    SizedBox(
                      width: 1.sw,
                      child: Text(
                        content,
                        style: getRegularStyle(
                            color: ColorManager.thirdBlack,
                            fontSize: FontSize.s14),
                      ),
                    ),
                    if (endDate != null) ...[
                      8.verticalSpace,
                      SizedBox(
                        width: 1.sw,
                        child: Text.rich(
                          TextSpan(
                              text: "${context.locale.expiration_date}: ",
                              style: getMediumStyle(
                                  color: ColorManager.thirdBlack,
                                  fontSize: FontSize.s14),
                              children: [
                                TextSpan(
                                  text: endDate,
                                  style: getMediumStyle(
                                      color: ColorManager.mainRed,
                                      fontSize: FontSize.s14),
                                ),
                              ]),
                        ),
                      )
                    ],
                  ],
                ),
              ),
            ),
            16.verticalSpace,
            CustomButton(
              frontText: 'Keçərli Filiallara Bax',
              prefixIcon: SvgPicture.asset(IconAssets.location),
              backgroundColor: ColorManager.mainBlue.withOpacity(0.1),
              foregroundColor: ColorManager.mainBlue,
              borderColor: ColorManager.mainBlue.withOpacity(0),
              onPressed: showBranches,
            ),
            8.verticalSpace,
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
