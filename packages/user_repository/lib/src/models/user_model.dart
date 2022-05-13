import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String displayName;
  final String photoUrl;

  const UserModel({
    required this.uid,
    required this.displayName,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [uid, displayName, photoUrl];
}
