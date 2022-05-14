import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/app/widgets/app_bar.dart';
import 'package:product_list/app/widgets/app_drawer.dart';
import 'package:product_list/products/bloc/products_bloc.dart';
import 'package:product_list/products/widgets/product_comment.dart';

class ProductViewArguments extends Equatable {
  final String uid;

  const ProductViewArguments({required this.uid});

  @override
  List<Object> get props => [uid];
}

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as ProductViewArguments;

    final productsBloc = BlocProvider.of<ProductsBloc>(context);

    return BlocProvider(
      create: (context) => productsBloc,
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          state as ProductsSuccess;
          final currentProduct = state.products
              .firstWhere((product) => product.uid == arguments.uid);
          final createdAtDate = DateTime.parse(currentProduct.dateCreated);

          return Scaffold(
            appBar: PreferredSize(
                child: MainAppBar(
                  title: currentProduct.title,
                ),
                preferredSize: const Size(double.infinity, 60)),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 115,
                left: 16,
                right: 16,
              ),
              child: Column(
                children: [
                  Text("Bar code: ${currentProduct.barCode}"),
                  Text(
                      "Created date: ${createdAtDate.day}.${createdAtDate.month}.${createdAtDate.year}"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Product comments: "),
                  ...currentProduct.comments.map((comment) => ProductComment(
                      createdDate: comment.createdDate, text: comment.text)),
                ],
              ),
            ),
            drawer: const AppDrawer(),
            extendBodyBehindAppBar: true,
          );
        },
      ),
    );
  }
}
