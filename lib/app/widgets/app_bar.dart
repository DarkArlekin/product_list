import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String title;
  final List<Widget> actions;

  const MainAppBar({Key? key, this.title = "", required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),

      actions: actions,
    );
  }
}
