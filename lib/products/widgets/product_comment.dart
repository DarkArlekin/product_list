import 'package:flutter/material.dart';

class ProductComment extends StatelessWidget {
  final String createdBy;
  final String createdDate;
  final String text;

  const ProductComment({
    Key? key,
    required this.text,
    required this.createdDate,
    required this.createdBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createdAtDate = DateTime.parse(createdDate);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(text, textAlign: TextAlign.left),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                createdBy,
              ),
              Text(
                "${createdAtDate.day}.${createdAtDate.month}.${createdAtDate.year}",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
