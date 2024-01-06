import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHeading extends StatelessWidget {
  final String title;

  const AppHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 18,
            decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.circular(18)),
          ),
          const SizedBox(
            width: 12,
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          )
        ],
      ),
    );
  }
}
