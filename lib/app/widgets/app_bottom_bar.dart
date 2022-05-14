import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  final IconData iconData;
  final void Function() onTap;

  const AppBottomBar({Key? key, this.iconData = Icons.add, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Icon(iconData),
        onTap: onTap,
      ),
    );
  }
}
