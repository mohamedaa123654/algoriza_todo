import 'package:flutter/material.dart';
import 'package:todo_algoriza/core/components/components.dart';
import 'package:todo_algoriza/core/util/color_manager.dart';
import 'package:todo_algoriza/features/home/presentation/pages/home.dart';

AppBar scheduleScreenAppBarDesign(BuildContext context) {
  return AppBar(
    // backgroundColor: ColorManager.white,
    bottomOpacity: 0.0,
    elevation: 1,

    title: const Text(
      'Schedule',
    ),
    leading: IconButton(
      icon: const Icon(Icons.keyboard_arrow_left),
      onPressed: () {
        navigateAndFinish(context, HomeScreen());
      },
    ),
  );
}
