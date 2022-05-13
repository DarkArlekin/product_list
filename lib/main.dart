import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/user/bloc/user_bloc.dart';

import 'core/constants/theme.dart';
import 'core/constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String initialRoute = appDefaultRoute;
  bool isAppRun = false;
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      initialRoute = Routes.productsScreen;
    } else {
      initialRoute = Routes.loginScreen;
    }
    if (!isAppRun) {
      isAppRun = true;
      BlocOverrides.runZoned(
            () => runApp(MyApp(initialRoute: initialRoute)),
      );
    }
  });
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'Flutter Product List',
        theme: appThemeData,
        initialRoute: initialRoute,
        routes: appRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
