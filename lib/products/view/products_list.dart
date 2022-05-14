import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/core/constants/routes.dart';
import 'package:product_list/products/bloc/products_bloc.dart';
import 'package:product_list/products/view/product_view_screen.dart';
import 'package:product_list/products/widgets/product_list_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 115),
            child: Column(
              children: [
                ...state.products.map((product) => ProductListItem(
                      barCode: product.barCode,
                      title: product.title,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.productViewScreen,
                            arguments: ProductViewArguments(uid: product.uid));
                      },
                    ))
              ],
            ),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Products',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        );
      },
    );
  }
}

// barCode
// "123123123"
// (string)
// comments
// dateCreated
// "2022-05-14 18:37:19.476733"
// title
// "Milk"
// uid
// "450eb378-60ea-44d3-8251-047927eaac74"
