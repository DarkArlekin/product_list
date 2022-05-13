import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
/// Firebase imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoggedInEvent>(_onLoggedIn);
    on<LoggedOutEvent>(_onLoggedOut);
  }

  void _onLoggedIn(LoggedInEvent event, Emitter<LoginState> emit) {
    signInWithGoogle();
  }

  void _onLoggedOut(LoggedOutEvent event, Emitter<LoginState> emit) {

  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  final result = await FirebaseAuth.instance.signInWithCredential(credential);

  return result;
}