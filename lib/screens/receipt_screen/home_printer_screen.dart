import 'package:air_point/models/products_model.dart';
import 'package:air_point/screens/products_screen/Bloc/app_cubit.dart';
import 'package:air_point/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'print_page.dart';

class HomePrinterScreen extends StatelessWidget {
  HomePrinterScreen({Key? key}) : super(key: key);
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    calculateTotal(context);
    return BlocConsumer<AppCubit, AppStates>(
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
                  itemCount: AppCubit.get(context).receiptProducts.length,
                  itemBuilder: (context, index) => buildProductItem(index + 1,
                      AppCubit.get(context).receiptProducts[index], context)),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Total: ${total}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PrintPage(
                                  AppCubit.get(context).receiptProducts),
                            ),
                          );
                        },
                        icon: Icon(Icons.print),
                        label: Text('Print'),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.green),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
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

  void calculateTotal(BuildContext context) {
    for (var item in AppCubit.get(context).receiptProducts) {
      total += double.parse(item.price ?? '0');
      total = total;
    }
    // print('total==$total');
  }
}
