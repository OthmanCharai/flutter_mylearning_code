import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/shared/appCubit/cubit.dart';
import 'package:second_project/shared/appCubit/states.dart';
import 'package:second_project/shared/components/components.dart';

class DoneTask extends StatelessWidget {
  const DoneTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 10.0,
      ),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var taskes = AppCubit.get(context).doneTaskes;
          return ListView.separated(
              itemBuilder: (context, index) =>
                  defaultTaks(taskes[index], context),
              separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsetsDirectional.only(
                      bottom: 10.0,
                      top: 10.0,
                    ),
                    child: Container(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ),
              itemCount: taskes.length);
        },
      ),
    );
  }
}