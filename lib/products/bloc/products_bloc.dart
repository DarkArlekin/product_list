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
    on<ProductsAddEvent>(_onProductsAdd);
    on<ProductsRemoveEvent>(_onProductsRemove);
    on<ProductsGetEvent>(_onProductsGet);
    _productSubscription = productRepository.getAllProducts().listen((products) {
      add(ProductsGetEvent(products));
    });
    // productRepository.
  }

  _onProductsGet(ProductsGetEvent event, Emitter<ProductsState> emit) {
    // print(event.products);

    if (state is ProductsSuccess) {
      emit(
         (state as ProductsSuccess).copyWith(products: event.products)
      );
    } else {
      emit(
          ProductsSuccess(products: event.products)
      );
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

  @override
  Future<void> close() {
    _productSubscription.cancel();
    return super.close();
  }
}
