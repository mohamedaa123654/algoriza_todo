import 'package:flutter/material.dart';

import '../../../../core/util/color_manager.dart';

AppBar appBarDesign(BuildContext context) {
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
      'Add Task',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    // iconTheme: const IconThemeData(color: ColorManager.black),
    // bottomOpacity: 0,
  );
}
