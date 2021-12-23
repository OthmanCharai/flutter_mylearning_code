import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second_project/models/user/userModel.dart';


class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);
  List<UserModel> users = [
    UserModel(id: 1, name: "othman charai", phone: "0628256054"),
    UserModel(id: 2, name: "fouad charai", phone: "025258258555"),
    UserModel(id: 3, name: "khalid charai", phone: "080506030120"),
    UserModel(id: 4, name: "othman charai", phone: "0628256054"),
     UserModel(id: 1, name: "othman charai", phone: "0628256054"),
    UserModel(id: 2, name: "fouad charai", phone: "025258258555"),
    UserModel(id: 3, name: "khalid charai", phone: "080506030120"),
    UserModel(id: 4, name: "othman charai", phone: "0628256054"),
     UserModel(id: 1, name: "othman charai", phone: "0628256054"),
    UserModel(id: 2, name: "fouad charai", phone: "025258258555"),
    UserModel(id: 3, name: "khalid charai", phone: "080506030120"),
    UserModel(id: 4, name: "othman charai", phone: "0628256054"),
     UserModel(id: 1, name: "othman charai", phone: "0628256054"),
    UserModel(id: 2, name: "fouad charai", phone: "025258258555"),
    UserModel(id: 3, name: "khalid charai", phone: "080506030120"),
    UserModel(id: 4, name: "othman charai", phone: "0628256054"),
     UserModel(id: 1, name: "othman charai", phone: "0628256054"),
    UserModel(id: 2, name: "fouad charai", phone: "025258258555"),
    UserModel(id: 3, name: "khalid charai", phone: "080506030120"),
    UserModel(id: 4, name: "othman charai", phone: "0628256054"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My contact'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => buildContactItems(users[index]),
            separatorBuilder: (context, index) => Container(
                  height: 1.0,
                  color: Colors.grey[200],
                ),
            itemCount: users.length));
  }
}

Widget buildContactItems(UserModel user) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Text('${user.id}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${user.phone}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
