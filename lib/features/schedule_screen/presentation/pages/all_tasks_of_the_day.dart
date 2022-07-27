import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/cubit/schedule_screen_cubit.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/widgets/schedule_screen_task_builder.dart';

class TasksOfThisDay extends StatelessWidget {
  const TasksOfThisDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleScreenCubit, ScheduleScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          var tasks = ScheduleScreenCubit.get(context).tasksOfThisDay;
          return ScheduleScreenTasksBuilder(tasks: tasks);
        });
  }
}
