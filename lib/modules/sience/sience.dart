import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/shared/components/components.dart';
import 'package:second_project/shared/newCubit/newCubit.dart';
import 'package:second_project/shared/newCubit/newStates.dart';

class Sience extends StatelessWidget {
  const Sience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        listener: (context, status) {},
        builder: (context, status) {
          var cubit = NewsCubit.get(context);
          return ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => defaultNews(
                    title: cubit.scienses[index+1]['title'],
                    time: cubit.scienses[index+1]["publishedAt"],
                    url: cubit.scienses[index+1]['urlToImage'],
                    context: context,
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10.0,
                  ),
              itemCount:6);
        });
  }
}