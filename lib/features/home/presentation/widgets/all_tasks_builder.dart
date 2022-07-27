import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/task_item.dart';

import '../../../../core/components/components.dart';
import '../../../../core/util/color_manager.dart';
import '../../../create_task_screen/presentation/pages/create_task_screen.dart';

class AllTasksBuilder extends StatelessWidget {
  List<Map> tasks;
  AllTasksBuilder({Key? key, required this.tasks}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: DefaultButton(
                onPressed: () {
                  navigateTo(context, CreateTaskScreen());
                },
                text: 'Add a Task',
                buttonColor: ColorManager.primary,
                width: double.infinity,
                height: 60,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          )
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
            const Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: DefaultButton(
                  onPressed: () {
                    navigateTo(context, CreateTaskScreen());
                  },
                  text: 'Add a Task',
                  buttonColor: ColorManager.grey,
                  width: double.infinity,
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
