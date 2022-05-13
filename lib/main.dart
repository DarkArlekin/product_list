import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/user/bloc/user_bloc.dart';

import 'core/constants/theme.dart';
import 'core/constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
        () => runApp(const MyApp()),
    // blocObserver: ,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'Flutter Product List',
        theme: appThemeData,
        initialRoute: appInitialRoute,
        routes: appRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


