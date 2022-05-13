import 'package:flutter/material.dart';
import 'package:product_list/login/pages/pages.dart';
import 'package:product_list/products/pages/products_page.dart';

/// App routes
class Routes {
  static const String productsScreen = '/products';
  static const String loginScreen = '/';
}

/// App initial route
const appDefaultRoute = Routes.loginScreen;

/// App route system
final Map<String, WidgetBuilder> appRoutes = {
  Routes.loginScreen: (_) => const LoginPage(),
  Routes.productsScreen: (_) => const ProductsPage(),
};