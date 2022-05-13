import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/core/constants/routes.dart';
import 'package:product_list/user/bloc/user_bloc.dart';

class LoadPage extends StatelessWidget {
  const LoadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Icon(Icons.list),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            Navigator.pushNamed(context, _routeTo(state));
          });
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        },
      ),
      extendBodyBehindAppBar: true,
    );
  }

  String _routeTo(UserState state) {
    switch (state.runtimeType) {
      case UserSuccess:
        return Routes.productsScreen;
      case UserError:
        return Routes.loginScreen;
      default:
        return Routes.loadScreen;
    }
  }
}
