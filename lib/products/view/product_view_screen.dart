import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/app/widgets/app_bar.dart';
import 'package:product_list/app/widgets/app_drawer.dart';
import 'package:product_list/products/bloc/products_bloc.dart';
import 'package:product_list/products/view/product_view_body.dart';
import 'package:product_list/products/widgets/widgets.dart';
import 'package:product_repository/product_repository.dart';

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
          final ProductModel currentProduct = state.products.firstWhere(
              (product) => product.uid == arguments.uid,
              orElse: () => state.products.first);
          final createdAtDate = DateTime.parse(currentProduct.dateCreated);

          return Scaffold(
            appBar: PreferredSize(
                child: MainAppBar(
                  title: currentProduct.title,
                  actions: [
                    ProductViewAction(
                      onChanged: (String? newValue) {
                        if (newValue == null) return;
                        if (newValue == "remove") {
                          Navigator.pop(context);
                          context
                              .read<ProductsBloc>()
                              .add(ProductsRemoveEvent(currentProduct.uid));
                        }
                      },
                      menuKey: 'remove',
                      icon: Icons.more_vert,
                    ),
                  ],
                ),
                preferredSize: const Size(double.infinity, 60)),
            body: ProductViewLayout(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bar code: ${currentProduct.barCode}"),
                    Text(
                        "Created date: ${createdAtDate.day}.${createdAtDate.month}.${createdAtDate.year}"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (currentProduct.comments.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Comments: ",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ...currentProduct.comments.map((comment) => ProductComment(
                      createdDate: comment.createdDate,
                      text: comment.text,
                      createdBy: comment.createdBy,
                    )),
              ],
            ),
            extendBodyBehindAppBar: true,
          );
        },
      ),
    );
  }
}
