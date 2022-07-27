import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/core/util/color_manager.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/all_tasks_builder.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/task_builder.dart';

import '../../../../../core/components/components.dart';
import '../../../../create_task_screen/presentation/pages/create_task_screen.dart';
import '../../cubit/home_cubit.dart';

class AllTaskScreen extends StatelessWidget {
  const AllTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var tasks = HomeCubit.get(context).allTasks;
          return AllTasksBuilder(tasks: tasks);
        });
  }
}
