import 'package:clean_car_customer_v2/components/padded_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/enum/status_types.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationInfoCard extends StatelessWidget {
  final StatusType statusType;
  const ReservationInfoCard({super.key, required this.statusType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: ColorManager.mainWhite),
      child: Padding(
        padding:
            EdgeInsets.only(top: 12.h, bottom: 16.h, left: 16.w, right: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kimyəvi təmizləmə",
                style:
                    getMediumStyle(color: ColorManager.mainBlack, fontSize: 16),
              ),
              Text(
                "21.00 ₼",
                style:
                    getMediumStyle(color: ColorManager.mainBlue, fontSize: 14),
              ),
            ],
          ),
          Text(
            "24 sentyabr, 16:30",
            style: getMediumStyle(
                color: ColorManager.secondaryBlack, fontSize: 14),
          ),
          Text(
            "Nizami Filialı",
            style: getMediumStyle(
                color: ColorManager.secondaryBlack, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   "Statusu : Ləğv edildi",
              //   style: getMediumStyle(
              //       color: ColorManager.secondaryBlack, fontSize: 14),
              // ),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Statusu : ',
                      style: getMediumStyle(
                          color: ColorManager.secondaryBlack, fontSize: 14),
                    ),
                    if (statusType == StatusType.accepted)
                      TextSpan(
                        text: 'Təsdiq edildi',
                        style: getMediumStyle(
                            color: ColorManager.secondaryGreen, fontSize: 14),
                      ),
                    if (statusType == StatusType.rejected)
                      TextSpan(
                        text: 'Ləğv edildi',
                        style: getMediumStyle(
                            color: ColorManager.mainRed, fontSize: 14),
                      ),
                    if (statusType == StatusType.finished)
                      TextSpan(
                        text: 'Tamamlandı',
                        style: getMediumStyle(
                            color: ColorManager.secondaryGreen, fontSize: 14),
                      ),
                    if (statusType == StatusType.waiting)
                      TextSpan(
                        text: 'Gözləmədədir',
                        style: getMediumStyle(
                            color: ColorManager.secondaryOrange, fontSize: 14),
                      ),
                  ],
                ),
              ),
              PaddedButton(
                  frontText: "Ətraflı",
                  onPressed: () {
                    Go.to(Pager.reservationDetail());
                  })
            ],
          )
        ]),
      ),
    );
  }
}
