import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String title;

  const AppTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 16,
          width: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red.withOpacity(.8),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
