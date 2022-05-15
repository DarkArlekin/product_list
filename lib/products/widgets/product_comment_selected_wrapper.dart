import 'package:flutter/material.dart';

class ProductCommentSelectedWrapper extends StatelessWidget {
  final void Function() onTap;
  final Widget child;

  const ProductCommentSelectedWrapper({Key? key, required this.onTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.lightBlue.withOpacity(0.2),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PopupMenuButton(
              elevation: 0,
              icon: const Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: const Text("Remove"),
                    onTap: onTap
                  )
                ];
              },
            ),
          ),
          Flexible(
            child: child,
          )
        ],
      ),
    );
  }
}
