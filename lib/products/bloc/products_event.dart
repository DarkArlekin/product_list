part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class ProductsAddEvent extends ProductsEvent {
  final String title;
  final String barCode;

  const ProductsAddEvent({required this.title, required this.barCode});

  @override
  List<Object> get props => [title, barCode];
}
