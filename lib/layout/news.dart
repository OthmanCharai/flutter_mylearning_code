import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/shared/components/components.dart';
import 'package:second_project/shared/newCubit/newCubit.dart';
import 'package:second_project/shared/newCubit/newStates.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusinessData()..getScinece()..getSportData(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
        var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
                
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                defaultBottomNavigationBarItem(
                  icon: Icons.business,
                  text: "Business",
                ),
                defaultBottomNavigationBarItem(
                  icon: Icons.sports_bar_outlined,
                  text: "Sport",
                ),
                defaultBottomNavigationBarItem(
                  icon: Icons.science,
                  text: "Scinece",
                ),
              ],
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.chnageBottomNavigationItem(value);
              },
            ),
          );
        },
      ),
    );
  }
}
