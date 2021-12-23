import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/modules/archived/archived.dart';
import 'package:second_project/modules/doneTasks/done_task.dart';
import 'package:second_project/modules/tasks/tasks.dart';
import 'package:second_project/shared/appCubit/states.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isBottomSheetOpen = false;
  IconData floatingButtomIcon = Icons.edit;
  late Database database;
  List<Map> Taskes = [];
  List<Map> newTaskes = [];

  List<Map> doneTaskes = [];
  List<Map> archivedTaskes = [];

  int currentIndex = 0;
  List<Widget> screens = [
    Tasks(),
    DoneTask(),
    Archived(),
  ];
  List<String> list = [
    'Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeState());
  }

  void createDataBase() async {
    database = await openDatabase("todo.db", version: 1,
        onCreate: (Database database, int version) {
      // When creating the db, create the table
      database
          .execute(
              'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,status TEXT)')
          .then((value) {
        print("dataBase wa created succesfuly");
      }).catchError((error) {
        print("error while creating data base ");
      });
    }, onOpen: (database) {
      getDataFromDatabase(database);
      print("Database Opend with success");
    });
  }

  Future insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              "INSERT INTO Tasks (title,date,time,status)VALUES('$title','$date','$time','new')")
          .then((value) {
        emit(AppInsertDatabaseState());
        print("$value was added Successfully");
        getDataFromDatabase(database);
      });
    }).then((value) {
      print("goood");
    }).catchError((Error) {
      print("error ");
    });
  }

  void getDataFromDatabase(database) {
    newTaskes = [];
    doneTaskes = [];
    archivedTaskes = [];
    database.rawQuery("SELECT * FROM Tasks").then((value) {
      Taskes = value;
      Taskes.forEach((element) {
        if (element['status'] == "new") {
          newTaskes.add(element);
        } else if (element['status'] == "done") {
          doneTaskes.add(element);
        } else if (element['status'] == "archived") {
          archivedTaskes.add(element);
        }
      });
      emit(AppGetDatabaseState());
      print(Taskes);
    });
  }

  void ChangeBottomNavigationSheets(bool isShow, IconData icons) {
    isBottomSheetOpen = isShow;
    floatingButtomIcon = icons;
  }

  void UpdateDatabase({
    required String status,
    required int id,
  }) async {
    database.rawUpdate("UPDATE Tasks SET status=? WHERE id=?",
        ["$status", "$id"]).then((value) {
      emit(AppUpdateDatabaseState());
      print("value was updated witch success");
      getDataFromDatabase(database);
      //emit(AppInsertDatabaseState());
    });
  }

  void deleteDatabase({required id}) async {
    database.rawDelete(
      "DELETE FROM Tasks WHERE id=?",
      ['$id'],
    ).then((value) {
      emit(AppDeleteDatabaseState());
      getDataFromDatabase(database);
    });
  }
}
