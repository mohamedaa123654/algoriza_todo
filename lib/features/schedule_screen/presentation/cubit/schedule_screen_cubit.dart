import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'schedule_screen_state.dart';

class ScheduleScreenCubit extends Cubit<ScheduleScreenState> {
  ScheduleScreenCubit() : super(ScheduleScreenInitial());
  static ScheduleScreenCubit get(context) => BlocProvider.of(context);

  String date = DateFormat('dd MMM, yyyy').format(DateTime.now()).toString();
  var initialSelectedDate = DateTime.now();
  String searchDate =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  String day = DateFormat.EEEE().format(DateTime.now()).toString();

  List<Map> tasksOfThisDay = [];

  getDataFromDatabaseByDate(database, date) {
    tasksOfThisDay = [];

    emit(ScheduleScreenGetDateLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((task) {
        if (task['repeat'] == 'daily') {
          tasksOfThisDay.add(task);
        }
        // else if ((task['repeat'] == 'monthly') &&
        //     (int.parse(task['deadline'].substring(8, 9)) ==
        //         int.parse(date.substring(8, 9)))) {
        //   print(
        //       '${date.substring(8, 10)}==${task['deadline'].substring(8, 10)}');

        //   print('11111111 ${task['repeat'] == 'monthly'}');
        //   print(
        //       '22222222 ${int.parse(task['deadline'].substring(8, 9)) == int.parse(date.substring(8, 9))}');
        //   tasksOfThisDay.add(task);
        // }
        else if (task['deadline'] == date) {
          tasksOfThisDay.add(task);
        }
      });
      // print('VVVVVVVVVVVVVVV$tasksOfThisDay');

      emit(ScheduleScreenGetDateState());
    });
  }

  updateDate(value) {
    emit(ScheduleScreenUpdateDateLoadingState());
    date = DateFormat('dd MMM, yyyy').format(value).toString();
    searchDate = DateFormat('yyyy-MM-dd').format(value).toString();
    day = DateFormat.EEEE().format(value).toString();
    emit(ScheduleScreenUpdateDateState());
  }
}
