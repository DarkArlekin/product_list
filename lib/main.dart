import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/app/app.dart';
/// Import self packages
import 'package:user_repository/user_repository.dart';

void main() {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      final userRepository = UserRepository()
        ..user.first;
      runApp(MyApp(userRepository: userRepository));
    },
    // blocObserver:
  );
}
