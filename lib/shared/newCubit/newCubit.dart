// ignore_for_file: unused_import

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/layout/news.dart';
import 'package:second_project/modules/business/business.dart';
import 'package:second_project/modules/sience/sience.dart';
import 'package:second_project/modules/soprt/sport.dart';
import 'package:second_project/shared/network/remote/helper_dio.dart';
import 'package:second_project/shared/newCubit/newStates.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialStates());
  int currentIndex = 0;
  bool themeMode = true;
  List<Widget> screens = [
    Business(),
    Sport(),
    Sience(),
  ];
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> scienses = [];

  static NewsCubit get(context) => BlocProvider.of(context);

  void chnageBottomNavigationItem(index) {
    currentIndex = index;
    emit(NewsBottomNavigationChange());
  }

  void getBusinessData() {
    emit(NewsLoadingBusinesstData());
    HelperDio.getData(query: {
      "country": "eg",
      "category": "business",
      "apiKey": "a6970254a84f4df2a10cba1500e264f5",
    }, url: "v2/top-headlines")
        .then((value) {
      print(value.data['articles'][1]["title"].toString());
      business = value.data['articles'];
      emit(NewsGetBusinessDataSuccess());
    }).catchError((error) {
      emit(NewsGetBusinessDataError(error));
    });
  }

  bool isDark = false;

  void changeAppMode()
  {
    isDark = !isDark;
    emit(AppChangeModeState());
  }

  void getSportData() {
    emit(NewsLoadingSportData());
    HelperDio.getData(query: {
      "country": "eg",
      "category": "sport",
      "apiKey": "a6970254a84f4df2a10cba1500e264f5",
    }, url: "v2/top-headlines")
        .then((value) {
      print(value.data['articles'][1]["title"].toString());
      sports = value.data['articles'];
      emit(NewsGetSportDataSuccess());
    }).catchError((error) {
      emit(NewsGetSportDataError(error));
    });
  }

  void getScinece() {
    emit(NewsLoadingSciencetData());
    HelperDio.getData(query: {
      "country": "eg",
      "category": "science",
      "apiKey": "a6970254a84f4df2a10cba1500e264f5",
    }, url: "v2/top-headlines")
        .then((value) {
      print(value.data['articles'][1]["title"].toString());
      scienses = value.data['articles'];
      emit(NewsGetScienceDataSuccess());
    }).catchError((error) {
      emit(NewsGetScienceDataError(error));
    });
  }
}
