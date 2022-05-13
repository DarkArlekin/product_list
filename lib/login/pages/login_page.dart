import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/login/bloc/login_bloc.dart';
import 'package:product_list/login/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Icon(Icons.list),
            ),
            body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Вхід',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline2,
                  ),
                  const SizedBox(height: 8,),
                  LoginButton(handler: () {
                    context.read<LoginBloc>().add(LoggedInEvent());
                  })
                ],
              ),
            ),
            extendBodyBehindAppBar: true,
          );
        },
      ),
    );
  }
}
