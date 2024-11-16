import 'package:clean_car_customer_v2/constants/res/font_manager.dart';
import 'package:clean_car_customer_v2/features/notification/widget/notification_tile.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/res/asset_manager.dart';
import '../../constants/res/color_manager.dart';
import '../../constants/res/paddings.dart';
import '../../constants/res/radius_manager.dart';
import '../../constants/res/styles_manager.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

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
              child: Text(
                context.locale.notifications,
                style: getSemiBoldStyle(
                  color: ColorManager.mainWhite,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Container(
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
                    child: RefreshIndicator(
                      onRefresh: () async {},
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => 16.verticalSpace,
                        itemBuilder: (_, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "00.00.0000",
                                style: getMediumStyle(
                                    color: ColorManager.secondaryBlack,
                                    fontSize: FontSize.s14),
                              ),
                              8.horizontalSpace,
                              ...[
                                1,
                                2,
                                3
                              ].map((e) => NotificationTile(isReaden: e%2 == 1))
                            ],
                          );
                        },
                        itemCount: 2,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
