import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  late final StreamSubscription<UserAnswer>
      _userSubscription;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<UserChangeEvent>(_onUserChange);
    _userSubscription = userRepository.user.listen(
      (userAnswer) {
        add(UserChangeEvent(userAnswer));
      },
    );
  }

  _onUserChange(UserChangeEvent event, Emitter<UserState> emit) {
    if(event.answer.isLeft()) {
      emit(UserError());
    } else {
      final user = event.answer.toOption().toNullable()!;
      emit(UserSuccess(user: user));
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
