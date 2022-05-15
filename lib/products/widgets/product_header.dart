import 'package:flutter/material.dart';

class ProductHeader extends StatelessWidget {
  final String createdDate;
  final String barCode;

  const ProductHeader(
      {Key? key, required this.barCode, required this.createdDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Bar code: $barCode"),
          Text("Created date: $createdDate"),
        ],
      ),
    );
  }
}
