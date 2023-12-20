import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/calendar_widget.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/car_types_widgets.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/hour_button_widget.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/payment_method_widget.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/reservation_choose_car.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/reservation_location_card.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/material.dart';

class ReservationContent extends StatelessWidget {
  const ReservationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: Paddings.horizontal16,
            child: const ReservationLocationCard(),
          ),
          Gaps.h16,
          Padding(
            padding: Paddings.horizontal16,
            child: Text(
              "Avtomobili seç",
              style: getMediumStyle(
                color: ColorManager.mainBlack,
                fontSize: 14,
              ),
            ),
          ),
          Gaps.h10,
          Padding(
            padding: Paddings.horizontal16,
            child: const ReservationChooseCar(),
          ),
          Gaps.h16,
          Padding(
            padding: Paddings.horizontal16,
            child: Text(
              "Xidməti seç",
              style: getMediumStyle(
                color: ColorManager.mainBlack,
                fontSize: 14,
              ),
            ),
          ),
          Gaps.h10,
          const CarTypesWidgets(),
          Gaps.h16,
          Padding(
            padding: Paddings.horizontal16,
            child: Text(
              "Tarixi seç",
              style: getMediumStyle(
                color: ColorManager.mainBlack,
                fontSize: 14,
              ),
            ),
          ),
          Gaps.h10,
          Padding(
            padding: Paddings.horizontal16,
            child: const CalendarWidget(),
          ),
          Gaps.h16,
          Padding(
            padding: Paddings.horizontal16,
            child: Text(
              "Saat seç",
              style: getMediumStyle(
                color: ColorManager.mainBlack,
                fontSize: 14,
              ),
            ),
          ),
          Gaps.h10,
          Padding(
            padding: Paddings.horizontal16,
            child: const HourButtonWidget(),
          ),
          Gaps.h16,
          Padding(
            padding: Paddings.horizontal16,
            child: Text(
              "Ödəniş növünü seç",
              style: getSemiBoldStyle(
                color: ColorManager.mainBlack,
                fontSize: 16,
              ),
            ),
          ),
          Gaps.h10,
          Padding(
            padding: Paddings.horizontal16,
            child: const PaymentMethodWidget(),
          ),
          Gaps.h24,
          Padding(
            padding: Paddings.horizontal16,
            child: CustomButton(
              frontText: "Rezerv Et",
              onPressed: () {
                Go.to(Pager.reservationDetail(isNew: true));
              },
            ),
          ),
          Gaps.h24,
        ],
      ),
    );
  }
}
