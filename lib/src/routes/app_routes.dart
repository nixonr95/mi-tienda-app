import 'package:flutter/material.dart';

import '../views/categories/screens/categories_screen.dart';
import '../views/clients/screens/clients_screen.dart';
import '../views/home/home.dart';
import '../views/products/products.dart';

class AppRoutes {
  static const initialRoute = HomeScreen.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (_) => const HomeScreen(),
    ProductsScreen.routeName: (_) => const ProductsScreen(),
    CategoriesScreen.routeName: (_) => const CategoriesScreen(),
    ClientsScreen.routeName: (_) => const ClientsScreen(),
  };
}
