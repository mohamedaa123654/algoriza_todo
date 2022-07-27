import 'package:calender_picker/calender_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_algoriza/core/global_var.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/cubit/schedule_screen_cubit.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/widgets/horizontal_calendar.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/widgets/schedule_screen_task_builder.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/widgets/title_of_day.dart';
import '../../../../core/util/color_manager.dart';
import '../widgets/appbar.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);
  // final FixedExtentScrollController itemController =
  //     FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    // HomeCubit homeCubit = HomeCubit.get(context);
    // var tasks = homeCubit.tasksOfThisDay;
    ScheduleScreenCubit cubit = ScheduleScreenCubit.get(context);

    return BlocProvider(
      create: (BuildContext context) => ScheduleScreenCubit()
        ..getDataFromDatabaseByDate(db, cubit.searchDate),
      child: BlocConsumer<ScheduleScreenCubit, ScheduleScreenState>(
          listener: (BuildContext context, ScheduleScreenState state) {},
          builder: (BuildContext context, ScheduleScreenState state) {
            ScheduleScreenCubit cubit = ScheduleScreenCubit.get(context);

            return Scaffold(
              // backgroundColor: ColorManager.white,
              appBar: scheduleScreenAppBarDesign(context),
              body: Column(
                children: [
                  // scheduleScreenHorizontalCalendar(homeCubit, context),

                  const HorizontalCalender(),
                  const SizedBox(
                    height: 16,
                  ),
                  TitleOfDay(),
                  ScheduleScreenTasksBuilder(tasks: cubit.tasksOfThisDay),
                ],
              ),
            );
          }),
    );
  }
}
