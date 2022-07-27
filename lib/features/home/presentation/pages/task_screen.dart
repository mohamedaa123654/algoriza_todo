import 'package:flutter/material.dart';
import 'package:todo_algoriza/core/icon_broken.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/task_item.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/task_screen_item.dart';

import '../../../../core/util/color_manager.dart';

class TaskScreen extends StatelessWidget {
  Map? model;
  TaskScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: taskColor(),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title, deadline, starttime, endtime, remind, , color, status,isfavorite
                      TaskScreenitem(
                          titleicon: Icons.title,
                          title: ' Title',
                          value: model!['title']),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: TaskScreenitem(
                                  titleicon: IconBroken.Time_Circle,
                                  title: ' DeadLine',
                                  value: model!['deadline'])),
                          Expanded(
                              child: TaskScreenitem(
                                  titleicon: Icons.event_note,
                                  title: ' Status',
                                  value: model!['status'])),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: TaskScreenitem(
                                  titleicon: Icons.timelapse,
                                  title: ' StartTime',
                                  value: model!['starttime'])),
                          Expanded(
                              child: TaskScreenitem(
                                  titleicon: Icons.av_timer,
                                  title: 'EndTime',
                                  value: model!['endtime'])),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: TaskScreenitem(
                                  titleicon: Icons.repeat,
                                  title: ' Remind',
                                  value: model!['remind'])),
                          Expanded(
                              child: TaskScreenitem(
                                  titleicon: Icons.remember_me,
                                  title: ' Repeat',
                                  value: model!['repeat'])),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: TaskScreenitem(
                                  titleicon: Icons.color_lens,
                                  title: ' Color',
                                  value: model!['color'])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      // backgroundColor: ColorManager.white,
      bottomOpacity: 0.0,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(Icons.keyboard_arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'Task Details',
      ),
      // iconTheme: const IconThemeData(color: ColorManager.black),
      // bottomOpacity: 0,
    );
  }

  Color taskColor() {
    return model!['color'].toString() == 'red'
        ? ColorManager.red
        : model!['color'].toString() == 'orange'
            ? ColorManager.orange
            : model!['color'].toString() == 'blue'
                ? ColorManager.blue
                : ColorManager.yellow;
  }
}
