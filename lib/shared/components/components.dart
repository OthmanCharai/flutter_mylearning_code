import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second_project/shared/appCubit/cubit.dart';

Widget defaultButton({
  required Function()? onPressed,
}) =>
    Container(
      width: double.infinity,
      color: Colors.blue,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
Widget defaultTextField({
  bool isPassword = false,
  required TextEditingController controller,
  required IconData prefixIcon,
  IconData? icons,
  required Function()? onTaper,
  Function()? pressed,
  Function(String value)? onChnage,
  Function(String value)? onSubmit,
  required FormFieldValidator<String> validate,
  required String label,
  required TextInputType type,
  //required String ? Function (String value)? validate,
}) =>
    TextFormField(
      keyboardType: type,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(icons),
      ),
      onFieldSubmitted: onSubmit,
      onChanged: onChnage,
      onTap: onTaper,
      validator: validate,
    );
Widget defaultTaks(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDatabase(id: model['id']);
      },
      child: Container(
        width: double.infinity,
        child: Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.redAccent,
                child: Text(
                  "${model['time']}",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsetsDirectional.only(
                    start: 8.0,
                    bottom: 2.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${model['title']}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "${model['date']}",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).UpdateDatabase(
                    status: "done",
                    id: model['id'],
                  );
                },
                icon: Icon(Icons.done),
                color: Colors.green,
              ),
              SizedBox(
                width: 10.0,
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).UpdateDatabase(
                    status: "archived",
                    id: model['id'],
                  );
                },
                icon: Icon(Icons.archive_rounded),
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
    );
// The BottomNavBarItems
BottomNavigationBarItem defaultBottomNavigationBarItem({
  required IconData icon,
  required String text,
}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: text,
  );
}

Widget defaultNews({
  required String url,
  required String title,
  required String time,
}) {
  return Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 10.0,
      end: 10.0,
      top: 4.0,
    ),
    child: Row(
      children: [
        Container(
          width:100.0 ,
          height: 100.0,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ) ,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image(
            image: NetworkImage(url),
            width:100.0 ,
            height: 100.0,
            fit:BoxFit.cover,
            
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${title}",
                maxLines: 4,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "${time}",
              
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w200,
                
                ),
              ),

            ],
          ),
        ),
      ],
    ),
  );
}
