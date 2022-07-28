import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/onboarding/data/models/onboarding.dart';

import '../../../../core/util/color_manager.dart';

class BuildBoardingItem extends StatelessWidget {
  BoardingModel model;
  BuildBoardingItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(child: Image.asset(model.image)),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2,
                    color: ColorManager.black),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  model.body,
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontSize: 16.0, color: ColorManager.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
