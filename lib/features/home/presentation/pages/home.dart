import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/features/home/presentation/cubit/home_cubit.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) {},
        builder: (BuildContext context, HomeState state) {
          HomeCubit cubit = HomeCubit.get(context);

          return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: homeAppbar(context, cubit),
              body: TabBarView(children: cubit.screens),
            ),
          );
        });
  }
}
