import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/home/presentation/cubit/home_cubit.dart';
import '../../../../core/util/color_manager.dart';

class ScheduleScreenTaskItem extends StatelessWidget {
  Map? model;
  ScheduleScreenTaskItem({
    Key? key,
    required this.model,
  }) : super(key: key);
  bool? isCompleted = false;
  Color color = ColorManager.grey;
  IconData completedIcon = Icons.star_border;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(model!['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            color: taskColor(),
          ),
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        model!['starttime'],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.61,
                        child: Text(
                          model!['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, color: ColorManager.white),
                        ),
                      ),
                    ),
                  ],
                ),
                model!['status'] == 'completed'
                    ? const Icon(
                        Icons.check_circle_outline,
                        color: ColorManager.white,
                        size: 32,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                        color: ColorManager.white,
                        size: 32,
                      )
              ],
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        HomeCubit.get(context).deleteData(
          id: model!['id'],
        );
      },
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
