import 'package:air_point/models/products_model.dart';
import 'package:air_point/models/products_model.dart';
import 'package:air_point/screens/products_screen/Bloc/app_cubit.dart';
import 'package:air_point/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/products_model.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
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
          body: Container(
            width: 400,
            height: 400,
            child: Column(
              children: [
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      buildProductItem(AppCubit.get(context).productsModel!),
                  itemCount: 10,
                  itemBuilder: (context, index) => myDvider(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildProductItem(ProductsModel model) => Card(
        child: ListTile(
          title: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: Text(
                    model.id.toString(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      model.name.toString(),
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      model.groups.toString(),
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(model.price.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
