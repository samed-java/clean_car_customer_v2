import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: ColorManager.mainWhite,
          ),
          height: 280.h,
          width: double.infinity,
          child: TableCalendar(
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
                String currentMonth = DateFormat('MMMM').format(date);
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
            focusedDay: today,
            firstDay: DateTime.utc(2013, 1, 1),
            lastDay: DateTime.utc(2033, 1, 1),
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) => isSameDay(day, today),
          ),
        )
      ],
    );
  }
}
