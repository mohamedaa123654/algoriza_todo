import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_algoriza/core/components/components.dart';
import 'package:todo_algoriza/core/icon_broken.dart';
import 'package:todo_algoriza/core/global_var.dart';
import 'package:todo_algoriza/features/home/presentation/cubit/home_cubit.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/cubit/schedule_screen_cubit.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/pages/schedule_screen.dart';
import 'package:todo_algoriza/features/search/presentation/pages/search_screen.dart';

import '../../../../core/icon_broken.dart';
import '../../../../core/util/color_manager.dart';

AppBar homeAppbar(
  BuildContext context,
  HomeCubit cubit,
) {
  return AppBar(
    title: const Text(
      'Board',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(
          IconBroken.Search,
          size: 30,
        ),
        onPressed: () {
          navigateTo(context, SearchScreen());
        },
      ),
      IconButton(
        icon: const Icon(
          IconBroken.Edit_Square,
          size: 30,
        ),
        onPressed: () {
          HomeCubit.get(context).emit(AppChangeThemeLoadingState());
          HomeCubit.get(context).isDark
              ? AdaptiveTheme.of(context).setDark()
              : AdaptiveTheme.of(context).setLight();
          HomeCubit.get(context).changeAppMode();
          HomeCubit.get(context).emit(AppChangeThemeState());
        },
      ),
      IconButton(
        icon: const Icon(
          IconBroken.Calendar,
          size: 30,
        ),
        onPressed: () {
          ScheduleScreenCubit.get(context).getDataFromDatabaseByDate(
              db, DateFormat('yyyy-MM-dd').format(DateTime.now()).toString());
          navigateTo(context, ScheduleScreen());
        },
      ),
    ],
    bottom: TabBar(
      isScrollable: true,
      indicatorColor: ColorManager.primary,
      onTap: (index) {
        cubit.emit(AppChangeTabBarState());
      },
      tabs: cubit.tabTitles,
    ),
  );
}
