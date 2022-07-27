import 'package:flutter/material.dart';
import 'package:todo_algoriza/core/components/components.dart';
import 'package:todo_algoriza/core/util/color_manager.dart';
import 'package:todo_algoriza/core/util/strings_manager.dart';
import 'package:todo_algoriza/features/home/presentation/pages/home.dart';

AppBar onboardingAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: ColorManager.white,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DefaultButton(
          onPressed: () {
            navigateAndFinish(context, HomeScreen());
          },
          text: AppStrings.skip,
          width: 80,
          radius: 30,
          buttonColor: ColorManager.greyButton,
          textColor: Colors.black,
        ),
      )
    ],
    elevation: 0,
  );
}
