
import 'dart:convert';

import 'package:air_point/core/utils/network/dio_helper.dart';
import 'package:air_point/core/utils/network/end_point.dart';
import 'package:air_point/models/products_model.dart';
import 'package:air_point/screens/products_screen/products_screen.dart';
import 'package:air_point/screens/reset_screen/home_printer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(ShopInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    ProductScreen(),
    HomePrinterScreen(),
  ];
  List<String> titles = [
    'Products',
    'Reset',
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopChangeNavBarState());
  }

  List<ProductsModel> productsModels = [];

  void getCategoriesData() {
    print('heheherheheheheh');
    DioHelper.getData(
      url: '',
      query: {
        "status":"GetItem"
      }
    ).then((value) {
      print(value.statusCode);
      // debugPrint('Result==');
       var xxx= jsonDecode(value.toString());
      // debugPrint(xxx.toString());
      for(var item in xxx){
        var itemmmmm= ProductsModel.fromJson(item);
        print(itemmmmm.name);
        productsModels.add(itemmmmm);
      }

      print('length');
      print(productsModels.length.toString());
      emit(ShopSuccessGetCategories());
    }).catchError((error) {
      print('Erooror');
      print(error.toString());
      emit(ShopErrorGetCategories());
    });
  }

}