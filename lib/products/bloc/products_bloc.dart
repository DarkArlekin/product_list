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
    on<ProductsAddEvent>(_onProductAdd);
    _productSubscription = productRepository.getAllProducts().listen((event) {
      // todo: create handler
    });
    // productRepository.
  }

  _onProductAdd(ProductsAddEvent event, Emitter<ProductsState> emit) {
    productRepository.createProduct(ProductModel(
      title: event.title,
      barCode: event.barCode,
      dateCreated: DateTime.now().toString(),
      uid: const Uuid().v4(),
    ));
  }

  @override
  Future<void> close() {
    _productSubscription.cancel();
    return super.close();
  }
}
