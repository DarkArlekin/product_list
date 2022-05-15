import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/app/widgets/app_bar.dart';
import 'package:product_list/app/widgets/app_bottom_bar.dart';
import 'package:product_list/app/widgets/app_drawer.dart';
import 'package:product_list/core/constants/validators.dart';
import 'package:product_list/products/bloc/products_bloc.dart';
import 'package:product_list/products/view/product_view_layout.dart';
import 'package:product_list/products/widgets/product_comment_selected_wrapper.dart';
import 'package:product_list/products/widgets/product_header.dart';
import 'package:product_list/products/widgets/widgets.dart';
import 'package:product_list/user/bloc/user_bloc.dart';
import 'package:product_repository/product_repository.dart';

class ProductViewArguments extends Equatable {
  final String uid;

  const ProductViewArguments({required this.uid});

  @override
  List<Object> get props => [uid];
}

// todo: decompose to widgets

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
                          context
                              .read<ProductsBloc>()
                              .add(ProductsRemoveEvent(currentProduct.uid));
                          Navigator.pop(context);
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
                ProductHeader(
                    barCode: currentProduct.barCode,
                    createdDate:
                        "${createdAtDate.day}.${createdAtDate.month}.${createdAtDate.year}"),
                if (currentProduct.comments.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 16, right: 16),
                    child: Text(
                      "Comments: ",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ...currentProduct.comments.map((comment) {
                  final commentWidget = ProductComment(
                    createdDate: comment.dateCreated,
                    text: comment.text,
                    createdBy: comment.createdBy,
                  );
                  return comment.uid == state.selectedUid
                      ? InkWell(
                          child: ProductCommentSelectedWrapper(
                              onTap: () {
                                context.read<ProductsBloc>().add(
                                    ProductsCommentRemoveEvent(
                                        currentProduct.uid,
                                        comment: comment));
                              },
                              child: commentWidget),
                          onTap: () {
                            context
                                .read<ProductsBloc>()
                                .add(const ProductsSelectEvent(""));
                          },
                        )
                      : InkWell(
                          child: commentWidget,
                          onLongPress: () {
                            context
                                .read<ProductsBloc>()
                                .add(ProductsSelectEvent(comment.uid));
                          },
                        );
                }),
              ],
            ),
            bottomNavigationBar: AppBottomBar(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertFormDialog(
                    textFields: [
                      DialogTextField(
                        hintText: 'Comment',
                        key: 'text',
                        validator: Validators.isEmpty,
                      ),
                    ],
                    onSubmit: (dialogTextFields) {
                      DialogTextField findByKey(String key) =>
                          dialogTextFields.firstWhere(
                              (dialogTextField) => dialogTextField.key == key);
                      productsBloc.add(ProductsCommentAddEvent(
                          currentProduct.uid,
                          text: findByKey("text").value,
                          createdBy: (BlocProvider.of<UserBloc>(context).state
                                  as UserSuccess)
                              .user
                              .displayName));
                      Navigator.pop(context);
                    },
                  ),
                );
              },
              annotation: "add comment",
            ),
            extendBody: true,
            extendBodyBehindAppBar: true,
          );
        },
      ),
    );
  }
}
