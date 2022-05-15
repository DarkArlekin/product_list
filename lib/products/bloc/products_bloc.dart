import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';
import 'package:uuid/uuid.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;
  late final StreamSubscription _productSubscription;

  ProductsBloc(this.productRepository) : super(ProductsInitial()) {
    on<ProductsGetEvent>(_onProductsGet);
    on<ProductsAddEvent>(_onProductsAdd);
    on<ProductsRemoveEvent>(_onProductsRemove);
    on<ProductsCommentAddEvent>(_onProductsCommentAdd);
    on<ProductsCommentRemoveEvent>(_onProductsCommentRemove);
    on<ProductsSelectEvent>(_onProductsSelectEvent);
    _productSubscription =
        productRepository.getAllProducts().listen((products) {
      add(ProductsGetEvent(products), );
    }, onError: (Object error) {
          print('error');
        });
    // productRepository.
  }

  _onProductsGet(ProductsGetEvent event, Emitter<ProductsState> emit) {
    if (state is ProductsSuccess) {
      emit((state as ProductsSuccess).copyWith(products: event.products));
    } else {
      emit(ProductsSuccess(products: event.products));
    }
  }

  _onProductsAdd(ProductsAddEvent event, Emitter<ProductsState> emit) {
    productRepository.createProduct(ProductModel(
      title: event.title,
      barCode: event.barCode,
      dateCreated: DateTime.now().toString(),
      uid: const Uuid().v4(),
    ));
  }

  _onProductsRemove(ProductsRemoveEvent event, Emitter<ProductsState> emit) {
    productRepository.removeProduct(event.uid);
  }

  _onProductsCommentAdd(
      ProductsCommentAddEvent event, Emitter<ProductsState> emit) {
    productRepository.addProductComment(
        event.uid,
        Comment(
            createdBy: event.createdBy,
            text: event.text,
            dateCreated: DateTime.now().toString(),
            uid: const Uuid().v4()));
  }

  _onProductsCommentRemove(
      ProductsCommentRemoveEvent event, Emitter<ProductsState> emit) {
    productRepository.removeProductComment(event.uid, event.comment);
  }

  _onProductsSelectEvent(
      ProductsSelectEvent event, Emitter<ProductsState> emit) {
    if (state is ProductsSuccess) {
      emit((state as ProductsSuccess).copyWith(
        selectedUid: event.uid,
      ));
    }
  }

  @override
  Future<void> close() {
    _productSubscription.cancel();
    return super.close();
  }
}
