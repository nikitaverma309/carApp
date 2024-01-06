import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final Icon icon;
  bool? showHideBtn;
  bool? isEmail;

  AuthTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
    this.showHideBtn,
    this.isEmail,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.grey.withOpacity(.15)),
        color: Colors.white,
      ),
      child: TextFormField(
        keyboardType: widget.isEmail != null
            ? TextInputType.emailAddress
            : TextInputType.text,
        controller: widget.controller,
        obscureText: widget.showHideBtn != null && isHidden,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          hintText: widget.title,
          border: InputBorder.none,
          hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          suffixIcon: (widget.showHideBtn != null)
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  icon: isHidden
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off))
              : null,
        ),
      ),
    );
  }
}
