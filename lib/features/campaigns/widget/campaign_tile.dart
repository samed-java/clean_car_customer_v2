import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/campaigns/data/model/res/campaigns_res_model.dart';
import 'package:clean_car_customer_v2/features/campaigns/widget/campaign_branches_sheet.dart';
import 'package:clean_car_customer_v2/features/campaigns/widget/campaign_detail_sheet.dart';
import 'package:clean_car_customer_v2/utils/converters/campaing_converter.dart';
import 'package:clean_car_customer_v2/utils/extensions/datetime_extension/datetime_extension.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CampaignTile extends StatefulWidget {
  const CampaignTile({
    super.key,
    required this.isReaden,
    required this.data,
  });

  final bool isReaden;
  final Campaign data;

  @override
  State<CampaignTile> createState() => _CampaignTileState();
}

class _CampaignTileState extends State<CampaignTile> {
  bool _isExpanded = false;

  void onShowBranches() {
    Go.back();
    CampaignBranchesSheet.showCampaignBranches(campaign: widget.data);
  }

  void onReserveAction() {
    final onlyBranch =
        widget.data.washings?.length == 1 ? widget.data.washings?.first : null;
    final firstService = widget.data.services?.first;

    Go.to(Pager.reservation(
      branch: branchConverted(onlyBranch),
      service: serviceConverter(firstService),
    ));
  }

  @override
  Widget build(BuildContext context) {
    String description = widget.data.description!;
    String shortTitle = widget.data.shortTitle!;
    bool isLongText = shortTitle.length > 63;

    return Bounce(
      duration: DurationConstant.ms100,
      onPressed: () {
        CampaignDetailSheet.showCampaignDetail(
          title: widget.data.title!,
          content: widget.data.description!,
          reserveAction: onReserveAction,
          showBranches: onShowBranches,
          endDate: widget.data.endDate?.toShortDateString(),
        );
      },
      child: Container(
        margin: Paddings.vertical8,
        padding: Paddings.all16,
        decoration: BoxDecoration(
            color: ColorManager.mainWhite,
            borderRadius: BorderRadius.all(RadiusManager.radiusCircular10)),
        width: 1.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48.sp,
              height: 48.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.mainBackgroundColor,
              ),
              child: Center(
                child: SvgPicture.asset(
                  ImageAssets.campaign,
                  fit: BoxFit.contain,
                  width: 25.sp,
                  height: 25.sp,
                ),
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 1.sw,
                    child: Text(
                      widget.data.title!,
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(
                          color: widget.isReaden
                              ? ColorManager.mainBlack
                              : ColorManager.fourthBlack,
                          fontSize: FontSize.s14),
                    ),
                  ),
                  8.verticalSpace,
                  SizedBox(
                    width: 1.sw,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _isExpanded
                                ? description
                                : isLongText
                                    ? "${shortTitle.substring(0, 60)} "
                                    : shortTitle,
                            style: getRegularStyle(
                              color: ColorManager.fourthBlack,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          if (isLongText && !_isExpanded)
                            TextSpan(
                              text: "davamını oxu",
                              style: getUnderlineStyle(
                                color: ColorManager.mainBlue,
                                fontSize: FontSize.s14,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    _isExpanded = true;
                                  });
                                },
                            ),
                        ],
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  SizedBox(
                    width: 1.sw,
                    child: Text.rich(
                      TextSpan(
                        text: "${context.locale.expiration_date}: ",
                        style: getSemiBoldStyle(
                          color: ColorManager.thirdBlack,
                          fontSize: FontSize.s14,
                        ),
                        children: [
                          TextSpan(
                            text: widget.data.endDate!.toShortDateString(),
                            style: getSemiBoldStyle(
                              color: ColorManager.mainRed,
                              fontSize: FontSize.s14,
                            ),
                          ),
                        ],
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
