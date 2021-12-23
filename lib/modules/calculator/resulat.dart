import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final String gender;
  final double height;
  final int age;
  final int weight;
  Result({
    required this.gender,
    required this.height,
    required this.age,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Gender : $gender",
          ),
          Text(
            'Age : $age',
          ),
          Text(
            'Weight :$weight ',
          ),
          Text(
            'Height : $height',
          ),
        ],
      ),
    );
    ;
  }
  /*
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Gender : ',
          ),
          Text(
            'Age : ',
          ),
          Text(
            'Weight : ',
          ),
          Text(
            'Height : ',
          ),
        ],
      ),
    );*/
}
