import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/features/home/presentation/cubit/home_cubit.dart';

part 'task_screen_state.dart';

class CreateTaskScreenCubit extends Cubit<CreateTaskScreenState> {
  CreateTaskScreenCubit() : super(TaskScreenInitial());
  static CreateTaskScreenCubit get(context) => BlocProvider.of(context);

  List<String> remindItems = [
    '10 Minutes early',
    '30 Minutes early',
    '1 Hour early',
    '1 day early'
  ];
//Items for repeat DropdownButtonFormField
  List<String> repeatItems = ['none', 'daily', 'weekly', 'monthly', 'yearly'];
  List<String> taskColor = ['red', 'orange', 'yellow', 'blue'];
}
