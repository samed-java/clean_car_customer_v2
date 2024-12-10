import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/campaigns/data/model/res/campaigns_res_model.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/sheets/sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CampaignTile extends StatelessWidget {

  const CampaignTile({
    super.key,
    required this.isReaden,required this.data,
  });

  final bool isReaden;
  final CampaignModel data;


  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: DurationConstant.ms100,
      onPressed: () {
        Sheets.showExtraDetailSheet(
            title: data.title!,
            content: data.description!,
            endDate: data.endDate!,
            actionText: context.locale.visit_website,
            actionIcon: SvgPicture.asset(IconAssets.web,width: 16,height: 16,));
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
                )),
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
                      data.title!,
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(
                          color: isReaden
                              ? ColorManager.mainBlack
                              : ColorManager.fourthBlack,
                          fontSize: FontSize.s14),
                    ),
                  ),
                  8.verticalSpace,
                  SizedBox(
                    width: 1.sw,
                    child: Text(
                      data.description!,
                      style: getRegularStyle(
                          color: ColorManager.fourthBlack,
                          fontSize: FontSize.s14),
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
                              fontSize: FontSize.s14),
                          children: [
                            TextSpan(
                              text: data.endDate!.toString(),
                              style: getSemiBoldStyle(
                                  color: ColorManager.mainRed,
                                  fontSize: FontSize.s14),
                            ),
                          ]),
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
