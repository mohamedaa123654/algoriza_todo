import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/task_item.dart';

import '../../../../core/components/components.dart';
import '../../../../core/util/color_manager.dart';
import '../../../create_task_screen/presentation/pages/create_task_screen.dart';

class TaskBuilder extends StatelessWidget {
  List<Map> tasks;
  String? title;
  TaskBuilder({Key? key, required this.tasks, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return TaskItem(model: tasks[index]);
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
              itemCount: tasks.length,
            ),
          ),
        ],
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              title ?? 'No Tasks',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Widget tasksBuilder({
//   required List<Map> tasks,
// }) =>
    