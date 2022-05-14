import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:product_repository/error/failure.dart';
import 'package:product_repository/src/models/product_model.dart';

class ProductRepository {
  final productCollection = FirebaseFirestore.instance.collection('productCollection');

  // todo: add either
  // todo: implement method - ProductModel.fromSnapshot
  Stream<List<ProductModel>> getAllProducts() {
      return productCollection.snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductModel.fromSnapshot(doc))
            .toList();
      });
  }

  void createProduct(ProductModel productModel) {
    productCollection.add(productModel.toJson());
  }
}
