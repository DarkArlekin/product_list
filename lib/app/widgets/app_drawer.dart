import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/core/constants/routes.dart';
import 'package:product_list/login/bloc/login_bloc.dart';
import 'package:product_list/user/bloc/user_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          return Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 120,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(state.user.photoUrl),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Text(state.user.displayName),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('log out'),
                  onTap: () {
                    context.read<LoginBloc>().add(LoggedOutEvent());
                    Navigator.pushNamed(context, Routes.loginScreen);
                  },
                ),
              ],
            ),
          );
        }
        return const Drawer();
      },
    );
  }
}
