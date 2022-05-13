import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function handler;

  const LoginButton({Key? key, required this.handler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Login with google'),
          SizedBox(
            width: 12,
          ),
          Icon(Icons.login_rounded)
        ],
      ),
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      ),
      onPressed: () {
        handler();
      },
    );
  }
}
