
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/bloc/product_category/product_category_cubit.dart';
import 'package:product_app/screen/home_page.dart';
import 'bloc/product_by_category/product_by_category_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCategoryCubit>(
          create: (context) => ProductCategoryCubit(),
        ),
        BlocProvider<ProductByCategoryCubit>(
          create: (context) => ProductByCategoryCubit(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}