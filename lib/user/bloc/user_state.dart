part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserSuccess extends UserState {
  final UserModel user;

  const UserSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class UserError extends UserState {
  @override
  List<Object> get props => [];
}
