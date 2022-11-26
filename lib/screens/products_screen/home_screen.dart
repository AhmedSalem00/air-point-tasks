import 'package:air_point/models/products_model.dart';
import 'package:air_point/screens/products_screen/Bloc/app_cubit.dart';
import 'package:air_point/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  List<ProductsModel> products = [];

  HomeScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => myDvider(),
                    itemCount: products.length,
                    itemBuilder: (context, index) =>
                        buildProductItem(index + 1, products[index], context)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildProductItem(
      int index, ProductsModel model, BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        AppCubit.get(context).receiptProducts.add(model);
      },
      key: Key(index.toString()),
      child: Card(
        child: ListTile(
          title: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: Text(
                    index.toString(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
