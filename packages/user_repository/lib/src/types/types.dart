import 'package:dartz/dartz.dart';
import 'package:user_repository/errors/failure.dart';
import 'package:user_repository/user_repository.dart';

typedef UserAnswer = Either<UserFailure, UserModel>;