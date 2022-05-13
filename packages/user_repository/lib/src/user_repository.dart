import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:user_repository/errors/failure.dart';
import 'package:user_repository/src/types/types.dart';

import 'models/models.dart';

class UserRepository extends Equatable {
  Stream<UserAnswer> get user {
    return FirebaseAuth.instance.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return const Left(UserFailure("user is not logged in"));
      }
      final displayName = (firebaseUser.displayName ?? "nameless");
      return Right(UserModel(
          uid: firebaseUser.uid,
          displayName: displayName,
          photoUrl: firebaseUser.photoURL ??
              "https://via.placeholder.com/96?text=${displayName[0]}"));
    });
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
