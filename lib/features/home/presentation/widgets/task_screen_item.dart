import 'package:flutter/material.dart';
import 'package:todo_algoriza/core/components/components.dart';
import 'package:todo_algoriza/core/util/color_manager.dart';

import '../../../create_task_screen/presentation/widgets/text_form_field.dart';

class TaskScreenitem extends StatelessWidget {
  TaskScreenitem(
      {Key? key, required this.title, required this.value, this.titleicon})
      : super(key: key);
  String title;
  String value;
  IconData? titleicon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(titleicon, color: ColorManager.white, size: 32),
            Text(
              title,
              style: const TextStyle(
                  color: ColorManager.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            // color: ColorManager.grey2,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(value,
                style:
                    const TextStyle(color: ColorManager.white, fontSize: 20)),
          ),
        ),
      ],
    );
  }
}
