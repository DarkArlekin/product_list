import 'package:flutter/material.dart';

class ProductViewLayout extends StatelessWidget {
  final List<Widget> children;

  const ProductViewLayout({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 115,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...children,
        ],
      ),
    );
  }
}
