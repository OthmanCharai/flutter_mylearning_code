import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/shared/components/components.dart';
import 'package:second_project/shared/newCubit/newCubit.dart';
import 'package:second_project/shared/newCubit/newStates.dart';

class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, status) {},
        builder: (context, status) {
          var cubit = NewsCubit.get(context);
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => defaultNews(
                    title: cubit.sports[index+1]['title'],
                    time: cubit.sports[index+1]["publishedAt"],
                    url: cubit.sports[index+1]['urlToImage'],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10.0,
                  ),
              itemCount: cubit.sports.length-1);
        });
  }
}