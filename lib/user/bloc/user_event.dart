part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserChangeEvent extends UserEvent {
  final UserAnswer answer;

  const UserChangeEvent(this.answer);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}