import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;

  const AppTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.black.withOpacity(.7)),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: TextField(
            controller: controller,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: hintText),
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
        ),
      ],
    );
  }
}
