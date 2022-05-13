import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String displayName;
  final String photoUrl;

  const UserModel({
    required this.id,
    required this.displayName,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [id, displayName, photoUrl];
}
