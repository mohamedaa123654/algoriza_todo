import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';

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
          Workmanager().initialize(callbackDispatcher);
        } else if ((task['repeat'] == 'monthly') &&
            (int.parse(task['deadline'].substring(8, 10)) ==
                int.parse(date.substring(8, 10)))) {
          tasksOfThisDay.add(task);
          Workmanager().initialize(callbackDispatcher);
        } else if (task['deadline'] == date) {
          tasksOfThisDay.add(task);
          Workmanager().initialize(callbackDispatcher);
        }
      });

      emit(ScheduleScreenGetDateState());
    });
  }

  String dateOfToday =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  List<Map> tasksOfToday = [];

  createNotificationDate(database) {
    tasksOfToday = [];

    emit(ScheduleScreenGetDateLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((task) {
        if (task['repeat'] == 'daily') {
          tasksOfThisDay.add(task);
          Workmanager().initialize(callbackDispatcher);
        } else if (task['deadline'] == dateOfToday) {
          tasksOfThisDay.add(task);
          Workmanager().initialize(callbackDispatcher);
        }
      });

      emit(ScheduleScreenGetDateState());
    });
  }

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  Future showNotification() async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '${tasksOfToday[0]['title']}',
      '${tasksOfToday[0]['starttime']}',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      threadIdentifier: 'thread_id',
    );
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin!.show(
      0,
      'فَذَكِّرْ',
      'فَذَكِّرْ',
      platformChannelSpecifics,
    );
  }

  void callbackDispatcher() {
    // initial notifications
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    WidgetsFlutterBinding.ensureInitialized();

    flutterLocalNotificationsPlugin!.initialize(
      initializationSettings,
    );

    Workmanager().executeTask((task, inputData) {
      showNotification();
      return Future.value(true);
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
