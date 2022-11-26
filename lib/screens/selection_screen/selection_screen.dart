import 'package:air_point/models/products_model.dart';
import 'package:air_point/screens/products_screen/home_screen.dart';
import 'package:air_point/screens/products_screen/Bloc/app_cubit.dart';
import 'package:air_point/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionScreen extends StatelessWidget {
  SelectionScreen({Key? key}) : super(key: key);

  List<ProductsModel> allProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          allProducts = AppCubit.get(context).productsModels;
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => myDvider(),
                    itemCount: AppCubit.get(context).productSelection.length,
                    itemBuilder: (context, index) => buildProductItem(
                        index + 1,
                        AppCubit.get(context).productSelection[index],
                        context)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildProductItem(
      int index, String productCategory, BuildContext context) {
    return GestureDetector(
      onTap: () {
        List<ProductsModel> selectedProduct = allProducts
            .where((element) => element.groups == productCategory)
            .toList();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(products: selectedProduct)));
      },
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
              Text(
                productCategory,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
