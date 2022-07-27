import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/features/home/presentation/widgets/task_builder.dart';
import 'package:todo_algoriza/features/search/presentation/cubit/search_cubit.dart';
import 'package:todo_algoriza/features/search/presentation/widgets/appbar.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
        listener: (BuildContext context, SearchState state) {},
        builder: (BuildContext context, SearchState state) {
          SearchCubit cubit = SearchCubit.get(context);
          return Scaffold(
              appBar: appBarSearchScreen(context),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      onChanged: (value) {
                        cubit.filterSeach(value);
                      },
                      controller: search,
                      decoration: const InputDecoration(
                          hintText: 'Search...',
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          )),
                    ),
                  ),
                  Expanded(
                      child: TaskBuilder(
                    tasks: cubit.searchItems,
                    title: 'No Tasks Found',
                  )),
                ],
              ));
        });
  }
}
