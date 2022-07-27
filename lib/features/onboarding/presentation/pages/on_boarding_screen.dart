import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_algoriza/features/home/presentation/pages/home.dart';
import 'package:todo_algoriza/features/onboarding/presentation/widgets/appbar.dart';
import 'package:todo_algoriza/features/onboarding/presentation/widgets/body.dart';

import '../../../../core/components/components.dart';
import '../../../../core/util/color_manager.dart';
import '../../../../core/util/strings_manager.dart';
import '../cubit/onboarding_cubit.dart';
import '../widgets/build_boarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => OnboardingCubit(),
        child: BlocConsumer<OnboardingCubit, OnboardingState>(
            listener: (BuildContext context, OnboardingState state) {},
            builder: (BuildContext context, OnboardingState state) {
              OnboardingCubit cubit = OnboardingCubit.get(context);
              return Scaffold(
                backgroundColor: ColorManager.white,
                appBar: onboardingAppbar(context),
                body: onboardingBody(cubit, context),
              );
            }));
  }
}
