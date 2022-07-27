part of 'schedule_screen_cubit.dart';

abstract class ScheduleScreenState extends Equatable {
  const ScheduleScreenState();

  @override
  List<Object> get props => [];
}

class ScheduleScreenInitial extends ScheduleScreenState {}

class LoadDateState extends ScheduleScreenState {}

class ScheduleScreenGetDateState extends ScheduleScreenState {}

class ScheduleScreenGetDateLoadingState extends ScheduleScreenState {}

class ScheduleScreenOnDateChangeLoadingState extends ScheduleScreenState {}

class ScheduleScreenOnDateChangeState extends ScheduleScreenState {}

class ScheduleScreenUpdateDateLoadingState extends ScheduleScreenState {}

class ScheduleScreenUpdateDateState extends ScheduleScreenState {}
