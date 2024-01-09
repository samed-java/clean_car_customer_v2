import 'package:clean_car_customer_v2/components/padded_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/data/model/res/reservation_parameters_res_model.dart';
import 'package:clean_car_customer_v2/features/profile_section/reservations/data/model/reservations_model.dart';
import 'package:clean_car_customer_v2/utils/enum/status_types.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/pager/go.dart';
import '../../../../utils/pager/pager.dart';

class ReservationInfoCard extends StatelessWidget {
  final Active activeReservation;

  const ReservationInfoCard({
    Key? key,
    required this.activeReservation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatusType statusType = getStatusTypeFromStatus(activeReservation.status);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: ColorManager.mainWhite,
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 12.h, bottom: 16.h, left: 16.w, right: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                activeReservation.service,
                style:
                    getMediumStyle(color: ColorManager.mainBlack, fontSize: 16),
              ),
              Text(
                "${activeReservation.price} ₼",
                style:
                    getMediumStyle(color: ColorManager.mainBlue, fontSize: 14),
              ),
            ],
          ),
          Text(
            "${activeReservation.day}, ${activeReservation.time}",
            style: getMediumStyle(
                color: ColorManager.secondaryBlack, fontSize: 14),
          ),
          Text(
            activeReservation.washingName,
            style: getMediumStyle(
                color: ColorManager.secondaryBlack, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '${context.locale.status} : ',
                      style: getMediumStyle(
                          color: ColorManager.secondaryBlack, fontSize: 14),
                    ),
                    TextSpan(
                      text: getStatusText(statusType),
                      style: getMediumStyle(
                          color: getStatusColor(statusType), fontSize: 14),
                    ),
                  ],
                ),
              ),
              PaddedButton(
                frontText: context.locale.detailed,
                onPressed: () {
                  Go.to(Pager.reservationDetail(
                      service: Service(
                          serviceId: 0,
                          title: activeReservation.service,
                          icon: "",
                          price: activeReservation.price),
                      branch: Branch(
                          id: 0,
                          washingName: activeReservation.washingName,
                          address: activeReservation.washingAddress),
                      car: activeReservation.car,
                      date: DateTime(
                          int.parse(activeReservation.day.split('.').last),
                          int.parse(
                              activeReservation.day.split('.').elementAt(1)),
                          int.parse(
                              activeReservation.day.split('.').elementAt(0))),
                      time: Time(
                          time: activeReservation.time,
                          isReserved:
                              true) //Car(id: 0, carModel: activeReservation., carNumber: carNumber, banType: banType),

                      ));
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }

  String getStatusText(StatusType statusType) {
    switch (statusType) {
      case StatusType.accepted:
        return 'Təsdiq edildi';
      case StatusType.rejected:
        return 'Ləğv edildi';
      case StatusType.finished:
        return 'Tamamlandı';
      case StatusType.waiting:
        return 'Gözləmədədir';
      default:
        return 'Bilinmir';
    }
  }

  Color getStatusColor(StatusType statusType) {
    switch (statusType) {
      case StatusType.accepted:
        return ColorManager.secondaryGreen;
      case StatusType.rejected:
        return ColorManager.mainRed;
      case StatusType.finished:
        return ColorManager.secondaryGreen;
      case StatusType.waiting:
        return ColorManager.secondaryOrange;
      default:
        return Colors.black;
    }
  }

  StatusType getStatusTypeFromStatus(String status) {
    switch (status) {
      case 'accepted':
        return StatusType.accepted;
      case 'rejected':
        return StatusType.rejected;
      case 'finished':
        return StatusType.finished;
      case 'waiting':
        return StatusType.waiting;
      default:
        return StatusType.unknown;
    }
  }
}
