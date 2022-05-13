part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoggedInEvent extends LoginEvent {
}

class LoggedOutEvent extends LoginEvent {
}
