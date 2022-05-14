import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/load/view/load_screen.dart';
import 'package:product_list/login/view/login_screen.dart';
import 'package:product_list/products/bloc/products_bloc.dart';
import 'package:product_list/products/view/product_view_screen.dart';
import 'package:product_list/products/view/products_screen.dart';
import 'package:product_repository/product_repository.dart';

/// App routes
class Routes {
  static const String productsScreen = '/products';
  static const String loginScreen = '/';
  static const String loadScreen = '/load';
  static const String productViewScreen = '/productView';
}

/// App initial route
const appDefaultRoute = Routes.loadScreen;

/// Create bloc for Product pages (https://bloclibrary.dev/#/recipesflutterblocaccess?id=named-route-access)
final _productBloc = ProductsBloc(ProductRepository());

/// App route system
final Map<String, WidgetBuilder> appRoutes = {
  Routes.loadScreen: (_) => const LoadScreen(),
  Routes.loginScreen: (_) => const LoginScreen(),
  Routes.productsScreen: (_) => BlocProvider.value(
        value: _productBloc,
        child: const ProductsScreen(),
      ),
  Routes.productViewScreen: (_) => BlocProvider.value(
        value: _productBloc,
        child: const ProductViewScreen(),
      ),
};
