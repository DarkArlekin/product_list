part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class ProductsAddEvent extends ProductsEvent {
  final String title;
  final String barCode;

  const ProductsAddEvent({required this.title, required this.barCode});

  @override
  List<Object> get props => [title, barCode];
}

class ProductsRemoveEvent extends ProductsEvent {
  final String uid;

  const ProductsRemoveEvent(this.uid);

  @override
  List<Object> get props => [uid];
}

class ProductsSelectEvent extends ProductsEvent {
  final String uid;

  const ProductsSelectEvent(this.uid);

  @override
  List<Object?> get props => [uid];
}

class ProductsCommentAddEvent extends ProductsEvent {
  final String uid;
  final String text;
  final String createdBy;

  const ProductsCommentAddEvent(this.uid, {required this.text, required this.createdBy});

  @override
  List<Object> get props => [text, createdBy, uid];
}
class ProductsCommentRemoveEvent extends ProductsEvent {
  final String uid;
  final Comment comment;

  const ProductsCommentRemoveEvent(this.uid, {required this.comment});

  @override
  List<Object> get props => [comment, uid];
}

class ProductsGetEvent extends ProductsEvent {
  final List<ProductModel> products;

  const ProductsGetEvent(this.products);

  @override
  List<Object> get props => [products];
}
