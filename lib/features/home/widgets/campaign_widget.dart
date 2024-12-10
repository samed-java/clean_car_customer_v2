import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/components/custom_notification_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/campaigns/cubit/campaigns_cubit.dart';
import 'package:clean_car_customer_v2/features/campaigns/data/model/res/campaigns_res_model.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CampaignWidget extends StatelessWidget {
  const CampaignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CampaignResModel>(
      stream: context.read<CampaignsCubit>().result,
      builder: (context, snapshot) {
        if(!snapshot.hasData || context.read<CampaignsCubit>().calculateNew() == 0) return 0.horizontalSpace;
        return Padding(
          padding: Paddings.horizontal16,
          child: Stack(
            children: [
              Container(
                padding: Paddings.all16,
                decoration: BoxDecoration(
                    color: ColorManager.mainWhite,
                    borderRadius: BorderRadius.all(RadiusManager.radiusCircular10)),
                width: 1.sw,
                height: 152,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(
                            text: context.locale.new_new,
                              style: getMediumStyle(
                                  color: ColorManager.mainBlack,
                                  fontSize: AppSize.s14),
                            children: [
                              TextSpan(
                                text:" ${context.read<CampaignsCubit>().calculateNew()} ${context.locale.from_campaign} ",
                                style: getSemiBoldStyle(
                                    color: ColorManager.mainBlue,
                                    fontSize: AppSize.s14),
                              ),
                              TextSpan(
                                  text:context.locale.switch_stay_informed,
                                  style: getMediumStyle(
                                      color: ColorManager.mainBlack,
                                      fontSize: AppSize.s14)),
                            ]
                          )),

                          const Spacer(),
                          SizedBox(
                              width: 96.w,
                              child: CustomButton(
                                  frontText: context.locale.all,
                                  onPressed: () {
                                    Go.to(Pager.campaign);
                                  }))
                        ],
                      ),
                    ),
                    50.horizontalSpace
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  width: 100.w,
                  ImageAssets.campaignAd,
                  color: ColorManager.mainBlue.withOpacity(0.1),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
