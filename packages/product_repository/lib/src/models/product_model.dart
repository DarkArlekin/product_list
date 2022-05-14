import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:product_repository/product_repository.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel extends Equatable {
  final String title;
  final String barCode;
  final String dateCreated;
  final String uid;
  final List<Comment> comments;

  const ProductModel(
      {required this.title,
      required this.barCode,
      required this.dateCreated,
      this.comments = const [],
      required this.uid});

  @override
  List<Object> get props => [title, barCode, dateCreated, comments, uid];

  /// Connect the generated [_$ProductModelFromJson] function to the `fromJson`
  /// factory.
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Connect the generated [_$ProductModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
