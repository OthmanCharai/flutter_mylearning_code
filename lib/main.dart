import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second_project/layout/home_page.dart';
import 'package:second_project/layout/news.dart';
import 'package:second_project/modules/calculator/calculator.dart';
import 'package:second_project/modules/contact/contact.dart';
import 'package:second_project/modules/counter/counter.dart';
import 'package:second_project/modules/login/login.dart';
import 'package:second_project/modules/messanger/messanger.dart';
import 'package:second_project/shared/network/remote/helper_dio.dart';
import 'modules/home/home.dart';

void main() {
  runApp(const MyApp());
  HelperDio.init();
  
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme:AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color:Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 20.0,
            ),
            elevation: 0.0,
            
            // ignore: deprecated_member_use
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.light,
            ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepOrange,
          type: BottomNavigationBarType.fixed,
        ),
      ),
          home:News(),
          debugShowCheckedModeBanner: false,
      );

  }
}
