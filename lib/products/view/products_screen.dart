import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/app/widgets/app_bar.dart';
import 'package:product_list/app/widgets/app_drawer.dart';
import 'package:product_list/products/bloc/products_bloc.dart';
import 'package:product_repository/product_repository.dart';
import 'products_list.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsBloc = BlocProvider.of<ProductsBloc>(context);

    return BlocProvider(
      create: (context) => productsBloc,
      child: const Scaffold(
        appBar: PreferredSize(
            child: MainAppBar(title: "Products",), preferredSize: Size(double.infinity, 60)),
        body: ProductList(),
        drawer: AppDrawer(),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
