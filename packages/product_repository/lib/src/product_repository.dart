import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:product_repository/error/failure.dart';
import 'package:product_repository/src/models/product_model.dart';

class ProductRepository {
  final productCollection = FirebaseFirestore.instance.collection('products');

  // todo: add either
  Stream<List<ProductModel>> getAllProducts() {
      return productCollection.snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList();
      });
  }

  void createProduct(ProductModel productModel) {
    productCollection.add(productModel.toJson());
  }
}
