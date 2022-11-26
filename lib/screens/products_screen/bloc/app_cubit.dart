import 'dart:convert';

import 'package:air_point/core/utils/network/dio_helper.dart';
import 'package:air_point/core/utils/network/end_point.dart';
import 'package:air_point/models/products_model.dart';
import 'package:air_point/screens/receipt_screen/home_printer_screen.dart';
import 'package:air_point/screens/selection_screen/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(ShopInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  double receiptTotal = 0.0;

  List<Widget> screens = [
    SelectionScreen(),
    HomePrinterScreen(),
  ];
  List<String> titles = [
    'Product Categories',
    'Receipt',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopChangeNavBarState());
  }

  List productSelection = [];

  List<ProductsModel> productsModels = [];

  List<ProductsModel> receiptProducts = [];

  void getCategoriesData() {
    DioHelper.getData(url: Url, query: {"status": "GetItem"}).then((value) {
      // print(value.statusCode);
      // debugPrint('Result==');
      var xxx = jsonDecode(value.toString());
      // debugPrint(xxx.toString());
      for (var item in xxx) {
        var itemmmmm = ProductsModel.fromJson(item);
        if (!productSelection.contains(itemmmmm.groups)) {
          productSelection.add(itemmmmm.groups);
        }
        productsModels.add(itemmmmm);
      }
      // print(productSelection.length);
      // print(productSelection);
      // print(productsModels.length.toString());
      emit(ShopSuccessGetCategories());
    }).catchError((error) {
      print('Erooror');
      print(error.toString());
      emit(ShopErrorGetCategories());
    });
  }
}
