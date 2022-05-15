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
  final String? selectedUid;

  const ProductsSuccess({required this.products, this.selectedUid});

  ProductsSuccess copyWith({List<ProductModel>? products, String? selectedUid}) =>
      ProductsSuccess(
        products: products ?? this.products,
        selectedUid: selectedUid ?? this.selectedUid,
      );

  @override
  List<Object?> get props => [products, selectedUid];
}

class ProductsError extends ProductsState {
  final String reason;

  const ProductsError({required this.reason});

  @override
  List<Object> get props => [reason];
}
