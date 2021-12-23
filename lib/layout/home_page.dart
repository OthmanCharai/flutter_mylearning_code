import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:second_project/shared/appCubit/cubit.dart';
import 'package:second_project/shared/appCubit/states.dart';
import 'package:second_project/shared/components/constent.dart';
import 'package:sqflite/sqflite.dart';

import 'package:second_project/modules/archived/archived.dart';
import 'package:second_project/modules/doneTasks/done_task.dart';
import 'package:second_project/modules/tasks/tasks.dart';
import 'package:second_project/shared/components/components.dart';

class Main extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  bool isPassword = false;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: Text(
                  cubit.list[cubit.currentIndex],
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              body: cubit.Taskes.length == 0
                  ? Center(child: CircularProgressIndicator())
                  : cubit.screens[cubit.currentIndex],
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  if (cubit.isBottomSheetOpen) {
                    if (formkey.currentState!.validate()) {
                      cubit.insertToDatabase(
                        title: titleController.text,
                        date: dateController.text,
                        time: timeController.text,
                      ).then((value) {
                        print("$value was added to SGBD ");
                      });

                      cubit.ChangeBottomNavigationSheets(false, Icons.edit);
                      Navigator.pop(context);
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet(
                          (context) => Form(
                            key: formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  color: Colors.grey[300],
                                  child: defaultTextField(
                                      //icons: isPassword ? Icons.visibility : Icons.visibility_off,
                                      type: TextInputType.name,
                                      controller: titleController,
                                      prefixIcon: Icons.title,
                                      label: "Title",
                                      onTaper: () {
                                        print("title tap");
                                      },
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "title cannot be empty";
                                        } else {
                                          titleController.text = value;
                                          print("value");
                                        }
                                      }),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  color: Colors.grey[300],
                                  child: defaultTextField(

                                      //icons: isPassword ? Icons.visibility : Icons.visibility_off,
                                      type: TextInputType.datetime,
                                      controller: timeController,
                                      prefixIcon: Icons.timelapse,
                                      label: "Time",
                                      onTaper: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          timeController.text =
                                              value!.format(context).toString();
                                        });
                                      },
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "time cannot be empty";
                                        } else {
                                          timeController.text =
                                              value.toString();
                                          print("value ${value.toString()}");
                                        }
                                      }),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  color: Colors.grey[300],
                                  child: defaultTextField(
                                      //icons: isPassword ? Icons.visibility : Icons.visibility_off,
                                      type: TextInputType.datetime,
                                      controller: dateController,
                                      prefixIcon: Icons.date_range,
                                      label: "Date",
                                      onTaper: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse("2023-12-10"),
                                        ).then((value) {
                                          //dateController.text =DateFormat.yMMMd().format(value!);
                                          print(DateFormat.yMMMd()
                                              .format(value!));
                                          dateController.text =
                                              DateFormat.yMMMd().format(value);
                                        });
                                      },
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "date cannot be empty";
                                        } else {
                                          dateController.text =
                                              value.toString();
                                          print("value ${value.toString()}");
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                        )
                        .closed
                        .then((value) {
                      /*  setState(() {
                    floatingButtomIcon = Icons.edit;
                  }); */
                      //isBottomSheetOpen = false;
                      cubit.ChangeBottomNavigationSheets(false, Icons.edit);
                    });
                    /* setState(() {
                  floatingButtomIcon = Icons.add;
                    isBottomSheetOpen = true;
                }); */
                    cubit.ChangeBottomNavigationSheets(true, Icons.add);
                  }
                },
                child: Icon(cubit.floatingButtomIcon),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: "Taskes",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle),
                    label: "Done",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined),
                    label: "archived",
                  ),
                ],
                currentIndex: cubit.currentIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
              ),
            );
          }),
    );
  }

  Future<String> getName() async {
    return "Othman Charai";
  }
}
