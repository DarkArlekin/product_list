import 'package:flutter/material.dart';
import 'package:product_list/app/widgets/app_bar.dart';
import 'package:product_list/app/widgets/app_drawer.dart';
import 'products_list.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          child: MainAppBar(), preferredSize: Size(double.infinity, 60)),
      body: ProductList(),
      drawer: AppDrawer(),
      extendBodyBehindAppBar: true,
    );
  }
}
