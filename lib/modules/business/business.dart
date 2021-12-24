import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/shared/components/components.dart';
import 'package:second_project/shared/newCubit/newCubit.dart';
import 'package:second_project/shared/newCubit/newStates.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        listener: (context, status) {},
        builder: (context, status) {
          var cubit = NewsCubit.get(context);
          return ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => defaultNews(
                    title: cubit.business[index]['title'],
                    time: cubit.business[index]["publishedAt"],
                    url: cubit.business[index]['urlToImage'],
                    context: context
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10.0,
                  ),
              itemCount: cubit.business.length);
        });
  }
}
