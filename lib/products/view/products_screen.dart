import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/app/widgets/app_bar.dart';
import 'package:product_list/app/widgets/app_bottom_bar.dart';
import 'package:product_list/app/widgets/app_drawer.dart';
import 'package:product_list/core/constants/validators.dart';
import 'package:product_list/products/bloc/products_bloc.dart';
import 'package:product_list/products/widgets/alert_form_dialog.dart';
import 'products_list.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsBloc = BlocProvider.of<ProductsBloc>(context);
    // todo: add event transformer
    return BlocProvider(
      create: (context) => productsBloc,
      child: Scaffold(
        appBar: const PreferredSize(
            child: MainAppBar(
              title: "Products",
              actions: [],
            ),
            preferredSize: Size(double.infinity, 60)),
        body: const ProductList(),
        drawer: const AppDrawer(),
        bottomNavigationBar: AppBottomBar(onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertFormDialog(
              textFields: [
                DialogTextField(
                  hintText: 'Product Title',
                  key: 'title',
                  validator: Validators.isEmpty,
                ),
                DialogTextField(
                  hintText: 'Bar Code',
                  key: 'barCode',
                  validator: Validators.barCode,
                ),
              ],
              onSubmit: (dialogTextFields) {
                DialogTextField findByKey(String key) =>
                    dialogTextFields.firstWhere(
                        (dialogTextField) => dialogTextField.key == key);
                productsBloc.add(ProductsAddEvent(
                    title: findByKey("title").value,
                    barCode: findByKey("barCode").value));
                Navigator.pop(context);
              },
            ),
          );
        }, annotation: "add product",),
        extendBodyBehindAppBar: true,
        extendBody: true,
      ),
    );
  }
}
