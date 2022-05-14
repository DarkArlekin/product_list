part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductsAddEvent extends ProductsEvent {
  final String title;
  final String barCode;

  const ProductsAddEvent({required this.title, required this.barCode});

  @override
  List<Object> get props => [title, barCode];
}

class ProductsGetEvent extends ProductsEvent {
  final List<ProductModel> products;

  const ProductsGetEvent(this.products);

  @override
  List<Object> get props => [products];

}
