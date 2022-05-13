import 'package:flutter/material.dart';
import 'package:product_list/load/view/load_page.dart';
import 'package:product_list/login/pages/pages.dart';
import 'package:product_list/products/pages/products_page.dart';

/// App routes
class Routes {
  static const String productsScreen = '/products';
  static const String loginScreen = '/';
  static const String loadScreen = '/load';
}

/// App initial route
const appDefaultRoute = Routes.loadScreen;

/// App route system
final Map<String, WidgetBuilder> appRoutes = {
  Routes.loadScreen: (_) => const LoadPage(),
  Routes.loginScreen: (_) => const LoginPage(),
  Routes.productsScreen: (_) => const ProductsPage(),
};