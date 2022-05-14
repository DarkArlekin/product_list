// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      createdBy: json['createdBy'] as String,
      createdDate: json['createdDate'] as String,
      text: json['text'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'text': instance.text,
      'uid': instance.uid,
    };
