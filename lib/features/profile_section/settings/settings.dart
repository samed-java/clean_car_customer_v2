import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/profile/widgets/profile_container_content.dart';
import 'package:clean_car_customer_v2/features/profile_section/settings/widgets/settings_container_content.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/pager/go.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBlue,
      body: SafeArea(
        top: true,
        bottom: false,
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
                    context.locale.adjustments,
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
                    // child: BranchesContent(),
                    child: const SettingsContainerContent()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
