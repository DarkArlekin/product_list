import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  final IconData iconData;
  final String annotation;
  final void Function() onTap;

  const AppBottomBar({Key? key, required this.onTap, this.iconData = Icons.add, this.annotation = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(iconData),
            ),
            Text(annotation),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
