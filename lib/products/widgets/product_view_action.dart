import 'package:flutter/material.dart';

class ProductViewAction extends StatelessWidget {
  final void Function(String?) onChanged;
  final String menuKey;
  final IconData icon;

  const ProductViewAction({
    Key? key,
    required this.onChanged,
    required this.menuKey,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Center(
        child: DropdownButton<String>(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          elevation: 16,
          onChanged: onChanged,
          items: [
            DropdownMenuItem(
              child: Text(menuKey),
              value: menuKey,
            ),
          ],
        ),
      ),
    );
  }
}
