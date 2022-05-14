import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment extends Equatable {
  final String createdBy;
  final String createdDate;
  final String text;
  final String uid;

  const Comment({required this.createdBy, required this.createdDate, required this.text, required this.uid});

  @override
  // TODO: implement props
  List<Object> get props => [createdDate, createdBy, text, uid];

  /// Connect the generated [_$CommentFromJson] function to the `fromJson`
  /// factory.
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  /// Connect the generated [_$CommentToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}