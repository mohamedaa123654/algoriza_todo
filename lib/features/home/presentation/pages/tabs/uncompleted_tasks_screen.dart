import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/task_builder.dart';
import '../../cubit/home_cubit.dart';

class UncompletedTaskScreen extends StatelessWidget {
  const UncompletedTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);

          var tasks = HomeCubit.get(context).uncompleteTasks;
          return TaskBuilder(
            tasks: tasks,
            title: 'No Tasks ',
          );
        });
  }
}
