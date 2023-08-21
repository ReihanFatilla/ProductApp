import 'package:flutter/material.dart';
import 'package:product_app/data/model/product_model.dart';
import 'package:product_app/screen/detail_screen.dart';
import 'package:product_app/screen/home_screen.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/': return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/detail': return MaterialPageRoute(builder: (_) => DetailScreen(product: settings.arguments as Products));
      default:
        return _routeError();
    }
  }

  static Route _routeError() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text("Something went wrong!"),
          ),
        ));
  }
}