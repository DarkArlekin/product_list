import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_repository/login_repository.dart';
import 'package:product_list/core/constants/routes.dart';
import 'package:product_list/core/constants/theme.dart';
import 'package:product_list/login/bloc/login_bloc.dart';
import 'package:product_list/user/bloc/user_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepository),
        ),
        BlocProvider(
          create: (context) => LoginBloc(LoginRepository()),
        ),
      ],
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
