import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservation_details/widgets/reservation_detail_content.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import '../my_cars/data/model/res/my_cars_res_model.dart';

class ReservationDetailScreen extends StatelessWidget {
  const ReservationDetailScreen(
      {super.key,
      this.isNew = false,
      required this.branch,
      required this.car,
      required this.service,
      required this.date,
      required this.time,
      this.onSubmit});
  final bool isNew;
  final Branch branch;
  final Car car;
  final Service service;
  final DateTime date;
  final Time time;
  final Function? onSubmit;

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
                    "Rezervasiya detalları",
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
                  child: ReservationDetailContent(
                    isNew: isNew,
                    branch: branch,
                    car: car,
                    service: service,
                    date: date,
                    time: time,
                    onSubmit: onSubmit,
                  ),
                ),
                // child: const MyCarsContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
