import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSmallButton extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color fgColor;
  final VoidCallback onTap;

  const AppSmallButton(
      {super.key,
      required this.bgColor,
      required this.fgColor,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        child: Icon(
          icon,
          color: fgColor,
        ),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
