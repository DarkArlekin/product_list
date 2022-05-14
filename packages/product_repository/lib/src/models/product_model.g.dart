// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      title: json['title'] as String,
      barCode: json['barCode'] as String,
      dateCreated: json['dateCreated'] as String,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'barCode': instance.barCode,
      'dateCreated': instance.dateCreated,
      'uid': instance.uid,
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };
