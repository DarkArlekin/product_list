import 'package:flutter/material.dart';
import 'package:product_list/app/widgets/app_bar.dart';
import 'package:product_list/app/widgets/app_drawer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          child: MainAppBar(), preferredSize: Size(double.infinity, 60)),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Products',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
    );
  }
}
