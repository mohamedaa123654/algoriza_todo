import 'package:flutter/material.dart';

import '../../../../core/util/color_manager.dart';

class Logo extends StatelessWidget {
  double textSize;
  Logo({Key? key, this.textSize = 32}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'What ',
          style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: ColorManager.sevencolor),
        ),
        Text(
          'Todo',
          style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary),
        )
      ],
    );
  }
}
