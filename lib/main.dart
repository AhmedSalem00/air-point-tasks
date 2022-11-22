import 'package:air_point/core/utils/network/dio_helper.dart';
import 'package:air_point/screens/products_screen/Bloc/app_cubit.dart';
import 'package:air_point/screens/products_screen/products_screen.dart';
import 'package:air_point/screens/reset_screen/home_printer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>AppCubit()..getCategoriesData(),
        )],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  ProductScreen(),
      ),
    );
  }
}


