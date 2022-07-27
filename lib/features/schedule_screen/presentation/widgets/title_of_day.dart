import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/features/schedule_screen/presentation/cubit/schedule_screen_cubit.dart';

class TitleOfDay extends StatelessWidget {
  TitleOfDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScheduleScreenCubit cubit = ScheduleScreenCubit.get(context);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cubit.day,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '${cubit.date}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
