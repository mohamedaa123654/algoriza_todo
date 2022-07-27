part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class AppChangeTabBarState extends HomeState {}

class AppCreateDatabaseState extends HomeState {}

class AppInsertToDatabaseState extends HomeState {}

class AppGetDatabaseLoadingState extends HomeState {}

class AppGetDatabaseState extends HomeState {}

class AppUpdateDatabaseState extends HomeState {}

class AppAddToFavoriteState extends HomeState {}

class AppDeleteDatabaseState extends HomeState {}

class ChangeUncompletedTaskState extends HomeState {}

class AppGetDateLoadingState extends HomeState {}

class AppChangeThemeLoadingState extends HomeState {}

class AppChangeThemeState extends HomeState {}

class AppGetDateState extends HomeState {}

class AppOnDateChangeLoadingState extends HomeState {}

class AppOnDateChangeState extends HomeState {}

class AppChangeChechboxLoadingState extends HomeState {}

class AppChangeChechboxState extends HomeState {}
