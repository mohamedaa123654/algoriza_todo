import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_algoriza/core/components/components.dart';
import 'package:todo_algoriza/core/util/color_manager.dart';
import 'package:todo_algoriza/core/util/strings_manager.dart';
import 'package:todo_algoriza/features/home/presentation/pages/home.dart';
import 'package:todo_algoriza/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:todo_algoriza/features/onboarding/presentation/widgets/build_boarding_item.dart';
import 'package:todo_algoriza/features/splash/presentation/widgets/logo.dart';

Padding onboardingBody(OnboardingCubit cubit, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
          ],
        ),
        Expanded(
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: cubit.boardController,
            onPageChanged: (int index) {
              if (index == cubit.boarding.length - 1) {
                cubit.isLastOnboardingScreen();
              } else {
                cubit.isNotLastOnboardingScreen();
              }
            },
            itemBuilder: (context, index) =>
                BuildBoardingItem(model: cubit.boarding[index]),
            itemCount: cubit.boarding.length,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: cubit.boardController,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: ColorManager.sevencolor,
                dotHeight: 5,
                expansionFactor: 1.1,
                dotWidth: 15,
                spacing: 3.0,
              ),
              count: cubit.boarding.length,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefaultButton(
            onPressed: () {
              navigateAndFinish(context, HomeScreen());
            },
            text: AppStrings.getStarted,
            isUpperCase: true,
            radius: 8,
          ),
        ),
      ],
    ),
  );
}
