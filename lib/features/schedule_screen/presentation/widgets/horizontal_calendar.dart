import 'package:calender_picker/calender_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_algoriza/core/global_var.dart';
import 'package:todo_algoriza/core/util/color_manager.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/cubit/schedule_screen_cubit.dart';

class HorizontalCalender extends StatelessWidget {
  const HorizontalCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScheduleScreenCubit cubit = ScheduleScreenCubit.get(context);
    return Column(children: [
      Material(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CalenderPicker(
                DateTime.now(),
                height: 85,
                initialSelectedDate: cubit.initialSelectedDate,
                selectionColor: ColorManager.primary,
                selectedTextColor: Colors.white,
                onDateChange: (value) {
                  // cubit.date =
                  //     DateFormat('dd MMM, yyyy').format(value).toString();
                  // cubit.searchDate =
                  //     DateFormat('yyyy-MM-dd').format(value).toString();

                  // cubit.day = DateFormat.EEEE().format(value).toString();
                  cubit.updateDate(value);
                  cubit.initialSelectedDate = value;

                  ScheduleScreenCubit.get(context).getDataFromDatabaseByDate(
                      db, DateFormat('yyyy-MM-dd').format(value).toString());
                },
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 24,
      ),
    ]);
  }
}
