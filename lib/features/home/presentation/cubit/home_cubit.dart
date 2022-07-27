import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_algoriza/core/global_var.dart';
import 'package:todo_algoriza/features/home/domain/datasourse/cache_helper.dart';
import '../pages/tabs/all_tasks_screen.dart';
import '../pages/tabs/completed_tasks_screen.dart';
import '../pages/tabs/favorite_tasks_screen.dart';
import '../pages/tabs/uncompleted_tasks_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  // Tabs Screens
  List<Widget> screens = const [
    AllTaskScreen(),
    CompletedTaskScreen(),
    UncompletedTaskScreen(),
    FavoriteTaskScreen()
  ];

  //Tabs Title
  List<Widget> tabTitles = const [
    Tab(
      text: 'All',
    ),
    Tab(
      text: 'Completed',
    ),
    Tab(
      text: 'Uncompleted',
    ),
    Tab(
      text: 'Favorite',
    ),
  ];

  late Database database;
  List<Map> allTasks = [];
  List<Map> completeTasks = [];
  List<Map> uncompleteTasks = [];
  List<Map> favoriteTasks = [];

//Create Database
  void createDatabase() async {
    openDatabase('todo.db', version: 1, onCreate: (database, version) async {
      print('database Created');

      await database
          .execute(
              'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, deadline TEXT, starttime TEXT, endtime TEXT, remind TEXT, repeat TEXT, color TEXT, status TEXT, isfavorite TEXT)')
          .then((value) {
        print('table Created');
      }).catchError((error) {
        debugPrint(error);
      });
    }, onOpen: (database) {
      debugPrint('database file is opened');
      getFromDatabase(database);
    }).then((value) {
      database = value;
      db = value;
      emit(AppCreateDatabaseState());
    }).catchError((error) {
      print('errro when opening the file');
    });
  }

  // insert to database
  void insertToDatabase({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required String remind,
    required String repeat,
    required String color,
  }) {
    database.transaction((txn) async {
      // insert into tableName
      txn
          .rawInsert(
              'INSERT INTO Tasks( title, deadline, starttime, endtime, remind, repeat, color, status,isfavorite) VALUES("$title", "$date", "$startTime", "$endTime","$remind", "$repeat", "$color", "uncompleted","false")')
          .then((value) {
        print('$value is inserted successfully');
        getFromDatabase(database);
        emit(AppInsertToDatabaseState());
      }).catchError((error) {
        print('an error when inserting into database');
      });
    });
  }

  void getFromDatabase(database) {
    allTasks = [];
    completeTasks = [];
    uncompleteTasks = [];
    favoriteTasks = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        allTasks.add(element);
        allTasksToSearch = allTasks;
        // print('AAAAAAAAAAAA$allTasks');
        if (element['status'] == 'completed')
          completeTasks.add(element);
        else if (element['status'] == 'uncompleted')
          uncompleteTasks.add(element);
        if (element['isfavorite'] == 'true') favoriteTasks.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }

// Update Database status
  void updateData({
    required String status,
    required int id,
  }) async {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value) {
      getFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  //add to favorite
  void addToFavorite({
    required String isfavorite,
    required int id,
  }) async {
    database.rawUpdate(
      'UPDATE tasks SET isfavorite = ? WHERE id = ?',
      [isfavorite, id],
    ).then((value) {
      getFromDatabase(database);
      emit(AppAddToFavoriteState());
    });
  }

//Delete Task from database
  void deleteData({
    required int id,
  }) async {
    await database
        .rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getFromDatabase(database);
      Fluttertoast.showToast(
          msg: "Task Deleted successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeThemeState());
      });
    }
  }
}
