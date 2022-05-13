import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/user/bloc/user_bloc.dart';

/// Import self packages
import 'package:user_repository/user_repository.dart';

import 'core/constants/theme.dart';
import 'core/constants/routes.dart';

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

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => UserBloc(userRepository: userRepository),
      child: MaterialApp(
        title: 'Flutter Product List',
        theme: appThemeData,
        initialRoute: appDefaultRoute,
        routes: appRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
