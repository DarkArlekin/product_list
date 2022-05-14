import 'package:flutter/material.dart';
import 'package:product_list/core/constants/routes.dart';

class ProductListItem extends StatelessWidget {
  final String title;
  final String barCode;
  final void Function() onTap;

  const ProductListItem({Key? key, required this.title, required this.barCode, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: ListTile(
          leading: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          title: Text(
            "Bar code: $barCode",
            textAlign: TextAlign.end,
          ),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5)),
          onTap: onTap),
    );
  }
}
