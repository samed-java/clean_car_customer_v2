import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/personal_info/widgets/personal_info_content.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

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
                    "Şəxsi məlumatlar",
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
                  child: const PersonalInfoContent(),

                  // child: Text("salam"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
