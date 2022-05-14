part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {

  const ProductsState();
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;

  const ProductsSuccess({required this.products});

  ProductsSuccess copyWith({List<ProductModel>? products}) => ProductsSuccess(
        products: products ?? this.products,
      );

  @override
  List<Object> get props => [products];
}

class ProductsError extends ProductsState {
  final String reason;

  const ProductsError({required this.reason});

  @override
  List<Object> get props => [reason];
}
