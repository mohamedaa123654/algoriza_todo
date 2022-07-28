import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/home/presentation/cubit/home_cubit.dart';
import 'package:todo_algoriza/features/home/presentation/pages/task_screen.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/checkbox.dart';
import '../../../../core/components/components.dart';
import '../../../../core/util/color_manager.dart';

class TaskItem extends StatelessWidget {
  Map? model;
  TaskItem({
    Key? key,
    required this.model,
  }) : super(key: key);
  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(model!['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Custom_Checkbox(
                          isChecked:
                              model!['status'] == 'completed' ? true : false,
                          onChange: () {
                            if (model!['status'] == 'completed') {
                              HomeCubit.get(context).updateData(
                                  id: model!['id'], status: 'uncompleted');
                            } else {
                              HomeCubit.get(context).updateData(
                                  id: model!['id'], status: 'completed');
                            }
                          },
                          backgroundColor: taskColor(),
                          borderColor: taskColor(),
                          iconColor: ColorManager.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(
                              context,
                              TaskScreen(
                                model: model,
                              ));
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.61,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              model!['title'].toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      if (model!['isfavorite'] == 'false') {
                        HomeCubit.get(context).addToFavorite(
                            id: model!['id'], isfavorite: 'true');
                      } else {
                        HomeCubit.get(context).addToFavorite(
                            id: model!['id'], isfavorite: 'false');
                      }
                    },
                    icon: Icon(
                      model!['isfavorite'] == 'false'
                          ? Icons.favorite_border
                          : Icons.favorite,
                      // color: iconColor,
                      color: favoriteColor(),
                      size: 32,
                    ),
                  ),
                ],
              ),
            ],
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

  Color favoriteColor() {
    return model!['isfavorite'].toString() == 'true'
        ? ColorManager.primary
        : ColorManager.grey;
  }
}
