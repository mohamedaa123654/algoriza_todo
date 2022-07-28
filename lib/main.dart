import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:todo_algoriza/core/global_var.dart';
import 'package:todo_algoriza/core/util/color_manager.dart';
import 'package:todo_algoriza/features/home/domain/datasourse/cache_helper.dart';
import 'package:todo_algoriza/features/home/presentation/cubit/home_cubit.dart';
import 'package:todo_algoriza/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:todo_algoriza/features/search/presentation/cubit/search_cubit.dart';
import 'package:todo_algoriza/features/splash/presentation/pages/splash_screen.dart';
import 'package:workmanager/workmanager.dart';

import 'core/bloc_observer.dart';
import 'features/create_task_screen/presentation/cubit/task_screen_cubit.dart';
import 'features/schedule_screen/presentation/cubit/schedule_screen_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      await CacheHelper.init();
      bool? isDark = CacheHelper.getData(key: 'isDark');
      runApp(MyApp(isDark));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  AdaptiveThemeMode? savedThemeMode;
  bool? isDark;
  MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeCubit()
              ..createDatabase()
              ..changeAppMode(fromShared: isDark)),
        BlocProvider(create: (BuildContext context) => OnboardingCubit()),
        BlocProvider(create: (BuildContext context) => CreateTaskScreenCubit()),
        BlocProvider(
            create: (BuildContext context) =>
                ScheduleScreenCubit()..createNotificationDate(db)),
        BlocProvider(create: (BuildContext context) => SearchCubit()),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) {},
        builder: (BuildContext context, HomeState state) {
          HomeCubit cubit = HomeCubit.get(context);

          return AdaptiveTheme(
            light: ThemeData(
                appBarTheme: const AppBarTheme(
                    backgroundColor: ColorManager.white,
                    titleTextStyle: TextStyle(
                        color: ColorManager.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    actionsIconTheme: IconThemeData(color: ColorManager.black),
                    iconTheme: IconThemeData(color: ColorManager.black)),
                tabBarTheme: const TabBarTheme(
                  labelColor: ColorManager.black,

                  unselectedLabelColor: ColorManager.grey,
                  labelPadding: EdgeInsets.symmetric(horizontal: 16),
                  // indicatorColor:  ColorManager.black,
                )),
            dark: ThemeData.dark(),
            initial: AdaptiveThemeMode.system,
            builder: (light, dark) => MaterialApp(
              // title: 'Adaptive Theme Demo',
              debugShowCheckedModeBanner: false,
              theme: light,
              darkTheme: dark,
              home: SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
