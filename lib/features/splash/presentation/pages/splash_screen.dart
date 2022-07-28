import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/home/presentation/pages/home.dart';
import '../../../../core/components/components.dart';
import '../../../../core/util/color_manager.dart';
import '../../../../core/util/constants_manager.dart';
import '../../../home/domain/datasourse/cache_helper.dart';
import '../../../onboarding/presentation/pages/on_boarding_screen.dart';
import '../widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  Widget? _widget;
  //start delay
  _startDelay() {
    if (onBoarding != null) {
      _widget = HomeScreen();
    } else {
      _widget = OnBoardingScreen();
      CacheHelper.putBoolean(key: 'onBoarding', value: true);
    }
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

//Navigat to next screen
  _goNext() async {
    navigateAndFinish(context, _widget);
  }

  @override
  void initState() {
    // Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    //Screen Design
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
          ],
        ),
      ),
    );
  }
}
