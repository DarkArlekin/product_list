// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      createdBy: json['createdBy'] as String,
      dateCreated: json['dateCreated'] as String,
      text: json['text'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'createdBy': instance.createdBy,
      'dateCreated': instance.dateCreated,
      'text': instance.text,
      'uid': instance.uid,
    };
