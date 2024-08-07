import 'package:animate_do/animate_do.dart';
import 'package:clean_car_customer_v2/components/custom_button.dart';
import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/calendar_widget.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/car_types_widgets.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/hour_button_widget.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/reservation_choose_car.dart';
import 'package:clean_car_customer_v2/features/branches_and_reservation/reservation/widgets/reservation_location_card.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:clean_car_customer_v2/utils/pager/go.dart';
import 'package:clean_car_customer_v2/utils/pager/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../locator.dart';
import '../../../../utils/pager/transition.dart';
import '../../../../utils/services/firebase/analytics/analytic_logger.dart';
import '../../../../utils/services/firebase/analytics/event.dart';
import '../cubit/reservation_cubit.dart';
import '../data/model/res/reservation_parameters_res_model.dart';

class ReservationContent extends StatelessWidget {
  const ReservationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: context.read<ReservationCubit>().scrollController,
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 1.sw,
          ),
          Padding(
            padding: Paddings.horizontal16,
            child: const ReservationLocationCard(),
          ),
          Gaps.h16,
          const ReservationChooseCar(),
          Gaps.h16,
          const CarTypesWidgets(),
          Gaps.h16,
          const CalendarWidget(),
          Gaps.h16,
          const HourButtonWidget(),
          Gaps.h16,
          Gaps.h24,
          ValueListenableBuilder<Time?>(
              valueListenable: context.read<ReservationCubit>().selectedTime,
              builder: (context, value, child) {
                if (value != null) {
                  return ZoomIn(
                      child: Padding(
                    padding: Paddings.horizontal16,
                    child: BlocListener<ReservationCubit, ReservationState>(
                      listener: (context, state) {
                        if (state is ReservationSuccess) {
                          PageTransitionUtils.navigateWithFadeInTransition(
                              context,
                              Pager.splash(
                                  svgAssets: ImageAssets.calendar,
                                  headerText: context.locale.booked,
                                  subText: context.locale.reservationfirsttext,
                                  page: Pager.main));
                        }
                      },
                      child: CustomButton(
                        frontText: context.locale.makereservation,
                        onPressed: () {
                          locator.get<EventLogger>().logEvent(event: Event.reservation_button_pressed,data: {
                            "branch": context
                                .read<ReservationCubit>()
                                .selectedBranch
                                .value!,
                            "car": context
                                .read<ReservationCubit>()
                                .selectedCar
                                .value!,
                            "service": context
                                .read<ReservationCubit>()
                                .selectedService
                                .value!,
                            "date": context
                                .read<ReservationCubit>()
                                .selectedDate
                                .value!,
                            "time": context
                                .read<ReservationCubit>()
                                .selectedTime
                                .value!,
                          });
                          Go.to(Pager.reservationDetail(
                              isNew: true,
                              branch: context
                                  .read<ReservationCubit>()
                                  .selectedBranch
                                  .value!,
                              car: context
                                  .read<ReservationCubit>()
                                  .selectedCar
                                  .value!,
                              service: context
                                  .read<ReservationCubit>()
                                  .selectedService
                                  .value!,
                              date: context
                                  .read<ReservationCubit>()
                                  .selectedDate
                                  .value!,
                              time: context
                                  .read<ReservationCubit>()
                                  .selectedTime
                                  .value!,
                              onSubmit: () =>
                                  context.read<ReservationCubit>().reserve()));
                        },
                      ),
                    ),
                  ));
                } else {
                  return const ReservationContentLoading();
                }
              }),
          Gaps.h24,
        ],
      ),
    );
  }
}
