part of 'task_screen_cubit.dart';

abstract class CreateTaskScreenState extends Equatable {
  const CreateTaskScreenState();

  @override
  List<Object> get props => [];
}

class TaskScreenInitial extends CreateTaskScreenState {}

class InsertTaskToDatabaseState extends CreateTaskScreenState {}

class SelectColorOfTaskLoadingState extends CreateTaskScreenState {}

class SelectColorOfTaskState extends CreateTaskScreenState {}
