import 'package:clean_nepali_calendar/clean_nepali_calendar.dart';
import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/core/constants/pallets.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  final NepaliCalendarController _nepaliCalendarController =
      NepaliCalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: AppStrings.calenderTitle,
          icon: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: CleanNepaliCalendar(
            controller: _nepaliCalendarController,
            initialDate: NepaliDateTime.now(),
            firstDate: NepaliDateTime(2070),
            lastDate: NepaliDateTime(2090),
            language: Language.english,
            calendarStyle: CalendarStyle(
              selectedColor: greenColor.withOpacity(0.5),
              dayStyle: const TextStyle(fontWeight: FontWeight.bold),
              todayStyle: const TextStyle(
                fontSize: 20.0,
              ),
              todayColor: redColor,
              // highlightSelected: true,
              renderDaysOfWeek: true,
              highlightToday: true,
            ),
            headerStyle: const HeaderStyle(
              enableFadeTransition: true,
              centerHeaderTitle: false,
              titleTextStyle: TextStyle(
                  height: 0,
                  fontWeight: FontWeight.bold,
                  color: redColor,
                  fontSize: 16.0),
              decoration: BoxDecoration(),
            ),
          ),
        ));
  }
}
