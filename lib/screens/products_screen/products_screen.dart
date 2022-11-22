import 'package:air_point/models/products_model.dart';
import 'package:air_point/models/products_model.dart';
import 'package:air_point/screens/products_screen/Bloc/app_cubit.dart';
import 'package:air_point/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/products_model.dart';

class ProductScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              print(00000000);
               cubit.changeIndex(index);
               print(00000000);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.task_alt_outlined),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Reset',
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],

        );
      },
    );
  }

}
