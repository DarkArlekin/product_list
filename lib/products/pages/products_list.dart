import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/core/constants/routes.dart';
import 'package:product_list/products/bloc/products_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return Column(
            children: [
              const SizedBox(
                height: 115,
              ),
              Text(
                'Products',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 16,
              ),
              ...state.products.map((product) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                        leading: Text(
                          product.title,
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                        title: Text(
                          "Bar code: ${product.barCode}",
                          textAlign: TextAlign.end,
                        ),
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        onTap: () {
                          // Navigator.pushNamed(context, Routes.productsScreen);
                        }),
                  )),
            ],
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
