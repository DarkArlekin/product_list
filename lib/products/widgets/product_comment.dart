import 'package:flutter/material.dart';

class ProductComment extends StatelessWidget {
  final String createdDate;
  final String text;

  const ProductComment({Key? key, required this.text, required this.createdDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createdAtDate = DateTime.parse(createdDate);

    return ListTile(leading: Text("${createdAtDate.day}.${createdAtDate.month}.${createdAtDate.year}"),title: Text(text),);
  }
}
