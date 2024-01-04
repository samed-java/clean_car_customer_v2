import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservation_details/widgets/reservation_detail_card.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:clean_car_customer_v2/utils/pager/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import '../../my_cars/data/model/res/my_cars_res_model.dart';

class ReservationDetailContent extends StatelessWidget {
  const ReservationDetailContent(
      {super.key,
      required this.isNew,
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ReservationDetailCard(
            headerText: "Ünvan",
            content: Row(
              children: [
                SvgPicture.asset(IconAssets.location),
                Gaps.w4,
                Expanded(
                    child: Text(
                  "${branch.washingName} ${branch.address}",
                  overflow: TextOverflow.ellipsis,
                  style: getMediumStyle(
                    color: ColorManager.secondaryBlack,
                    fontSize: 14,
                  ).copyWith(decoration: TextDecoration.underline),
                )),
              ],
            ),
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "${car.carModel}, ${car.carNumber} ",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: "Avtomobil adı və nömrəsi",
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "${service.title}",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: "Xidmət",
          ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "${DateFormat("dd.MM.yyyy").format(date)}  ${time.time}",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: "Tarix və saat",
          ),
          Gaps.h16,
          // ReservationDetailCard(
          //   content: Text(
          //     "Kard",
          //     style: getMediumStyle(
          //       color: ColorManager.secondaryBlack,
          //       fontSize: 14,
          //     ),
          //   ),
          //   headerText: "Ödəniş növü",
          // ),
          Gaps.h16,
          ReservationDetailCard(
            content: Text(
              "${service.price} AZN",
              style: getMediumStyle(
                color: ColorManager.secondaryBlack,
                fontSize: 14,
              ),
            ),
            headerText: "Qiymət",
          ),
          Gaps.h16,
          isNew
              ? Gaps.empty
              : CustomButton(
                  frontText: "Sil",
                  onPressed: () {},
                  backgroundColor: ColorManager.mainBackgroundColor,
                  foregroundColor: ColorManager.mainRed,
                  borderColor: ColorManager.mainRed,
                ),
          Gaps.h12,
          isNew
              ? CustomButton(
                  frontText: "Təsdiqlə",
                  onPressed: () {
                    onSubmit?.call();
                  },
                )
              : CustomButton(
                  frontText: "Dəyişiklik Et",
                  onPressed: () {
                    onSubmit?.call();
                  },
                ),
          Gaps.h16
        ],
      ),
    );
  }
}
