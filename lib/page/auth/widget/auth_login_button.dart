import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoginButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AppLoginButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,

      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(200, 48),
         backgroundColor: Colors.blue.shade500,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
    );
  }
}
