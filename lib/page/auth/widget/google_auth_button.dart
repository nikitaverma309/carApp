 import 'package:flutter/material.dart';

class GoogleAuthButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleAuthButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Image.asset("assets/icon/google.png"),
      ),
    );

    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: Colors.blue.shade50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
      child: Row(
        children: [
          Spacer(),
          Container(
              height: 36,
              width: 36,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset("assets/icon/google.png")),
          SizedBox(
            width: 16,
          ),
          Text(
            "Continue with google",
            style: TextStyle(color: Colors.black),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
