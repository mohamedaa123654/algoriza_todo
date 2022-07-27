import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/widgets/schedule_screen_task_item.dart';

import '../../../../core/components/components.dart';
import '../../../../core/util/color_manager.dart';
import '../../../create_task_screen/presentation/pages/create_task_screen.dart';

class ScheduleScreenTasksBuilder extends StatelessWidget {
  List<Map> tasks;
  ScheduleScreenTasksBuilder({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => Expanded(
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ScheduleScreenTaskItem(model: tasks[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 1,
          ),
          itemCount: tasks.length,
        ),
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
              'No Tasks in This Day',
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
