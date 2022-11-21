
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


  ProductsModel? productsModel;

  void getCategoriesData() {
    DioHelper.getData(
      url: getCategories,
    ).then((value) {
      debugPrint('Result==');
      debugPrint(value.toString());
      productsModel = ProductsModel.fromJson(value.data);
      emit(ShopSuccessGetCategories());
    }).catchError((error) {
      emit(ShopErrorGetCategories());
    });
  }

}