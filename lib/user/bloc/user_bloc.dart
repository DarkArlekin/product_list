import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserInitEvent>(_onUserInit);
  }

  _onUserInit(UserInitEvent event, Emitter<UserState> emit) {
    // TODO: implement event handler
  }
}
