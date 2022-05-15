import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:product_repository/error/failure.dart';
import 'package:product_repository/src/models/comment.dart';
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

  void addProductComment(String uid, Comment comment) {
    productCollection.where("uid", isEqualTo: uid).get().then((event) {
      if (event.docs.isNotEmpty) {
        final DocumentReference<Map<String, dynamic>> document =
            event.docs.single.reference;
        document.set({
          "comments": FieldValue.arrayUnion([comment.toJson()]),
        }, SetOptions(merge: true));
      }
    });
  }

  void removeProduct(String uid) {
    productCollection.where("uid", isEqualTo: uid).get().then((event) {
      if (event.docs.isNotEmpty) {
        DocumentReference<Map<String, dynamic>> document =
            event.docs.single.reference;
        document.delete();
      }
    });
  }
}
