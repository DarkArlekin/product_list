import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/app/widgets/app_bar.dart';
import 'package:product_list/app/widgets/app_bottom_bar.dart';
import 'package:product_list/app/widgets/app_drawer.dart';
import 'package:product_list/products/bloc/products_bloc.dart';
import 'package:product_list/products/widgets/alert_form_dialog.dart';
import 'products_list.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsBloc = BlocProvider.of<ProductsBloc>(context);

    return BlocProvider(
      create: (context) => productsBloc,
      child: Scaffold(
        appBar: const PreferredSize(
            child: MainAppBar(
              title: "Products",
            ),
            preferredSize: Size(double.infinity, 60)),
        body: const ProductList(),
        drawer: const AppDrawer(),
        bottomNavigationBar: AppBottomBar(onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const AlertFormDialog(),
          );
        }),
        extendBodyBehindAppBar: true,
        extendBody: true,
      ),
    );
  }
}
