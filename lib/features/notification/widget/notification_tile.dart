import 'package:clean_car_customer_v2/components/custom_notification_button.dart';
import 'package:clean_car_customer_v2/components/custom_searchbar.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/notification/cubit/notifications_cubit.dart';
import 'package:clean_car_customer_v2/features/notification/data/model/res/notifications_res_model.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/sheets/sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../constants/res/asset_manager.dart';
import '../../../constants/res/color_manager.dart';
import '../../../constants/res/font_manager.dart';
import '../../../constants/res/paddings.dart';
import '../../../constants/res/radius_manager.dart';
import '../../../constants/res/styles_manager.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.isRead,
    required this.data,
  });

  final bool isRead;
  final NotificationModel data;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: DurationConstant.ms100,
      onPressed: () {
        context.read<NotificationsCubit>().readNotification(data.id.toString());
        Sheets.showExtraDetailSheet(
          title: data.title!,
          content: data.description!,
          //endDate: "00.00.0000",
          //actionText: "Vebsayta muraciet edin",
          //actionIcon: SvgPicture.asset(IconAssets.web,width: 16,height: 16,)
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
                    ImageAssets.logo,
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
                          color: !isRead
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
                  if (DateFormat("dd.MM.YYYY").format(DateTime.now()) ==
                      DateFormat("dd.MM.YYYY").format(data.createdAt!)) ...[
                    8.verticalSpace,
                    SizedBox(
                      height: 20.h,
                      width: 1.sw,
                      child: Text(
                          DateTime.now().difference(data.createdAt!).inHours>0?
                        "${DateTime.now().difference(data.createdAt!).inHours} saat evvel":context.locale.new_new,
                        overflow: TextOverflow.ellipsis,
                        style: getRegularStyle(
                            color: ColorManager.fourthBlack,
                            fontSize: FontSize.s14),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
