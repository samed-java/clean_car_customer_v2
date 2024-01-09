import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:clean_car_customer_v2/utils/extensions/locale_extension/locale_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../cubit/reservation_cubit.dart';
import '../data/model/res/reservation_parameters_res_model.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
      context.read<ReservationCubit>().selectDate(day);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReservationCubit>();
    return StreamBuilder<ReservationParametersResModel>(
        stream: cubit.params,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.services != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: Paddings.horizontal16,
                  child: Text(
                    context.locale.selectdate,
                    style: getMediumStyle(
                      color: ColorManager.mainBlack,
                      fontSize: 14,
                    ),
                  ),
                ),
                Gaps.h10,
                Padding(
                  padding: Paddings.horizontal16,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: ColorManager.mainWhite,
                        ),
                        height: 280.h,
                        width: double.infinity,
                        child: ValueListenableBuilder<DateTime?>(
                          valueListenable: cubit.selectedDate,
                          builder: (context, value,child) {
                            return TableCalendar(

                              calendarStyle: CalendarStyle(
                                outsideDecoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                weekendDecoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                defaultDecoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                todayDecoration: BoxDecoration(
                                    color: ColorManager.mainBlue,
                                    borderRadius: BorderRadius.circular(3.r),
                                    shape: BoxShape.rectangle),
                                isTodayHighlighted: false,
                                selectedDecoration: BoxDecoration(
                                    color: ColorManager.mainBlue,
                                    borderRadius: BorderRadius.circular(3.r),
                                    shape: BoxShape.rectangle),
                              ),
                              shouldFillViewport: true,
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              calendarFormat: CalendarFormat.month,
                              headerStyle: HeaderStyle(
                                titleTextFormatter: (date, locale) {
                                  // DateTime now = DateTime.now();
                                  String currentMonth =
                                      DateFormat('MMMM').format(date);
                                  return currentMonth.toString();
                                },
                                rightChevronIcon: SvgPicture.asset(
                                  IconAssets.rightArrow,
                                  colorFilter: ColorFilter.mode(
                                      ColorManager.secondaryBlack, BlendMode.srcIn),
                                ),
                                leftChevronIcon: SvgPicture.asset(
                                  IconAssets.backButton2,
                                  colorFilter: ColorFilter.mode(
                                      ColorManager.secondaryBlack, BlendMode.srcIn),
                                ),
                                formatButtonVisible: false,
                                titleCentered: true,
                              ),
                              focusedDay: value??DateTime.now(),
                              firstDay: DateTime.now(),
                              lastDay: DateTime.utc(2033, 1, 1),
                              onDaySelected: _onDaySelected,
                              selectedDayPredicate: (day) => isSameDay(day, value),
                            );
                          }
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
