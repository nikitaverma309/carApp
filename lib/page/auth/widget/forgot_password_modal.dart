 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import 'auth_textfield.dart';

class ForgotPasswordModal extends StatelessWidget {
  const ForgotPasswordModal({super.key});

  @override
  Widget build(BuildContext context) {
    buildTitle({required String title}) {
      return Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ));
    }

    return Consumer<AuthProvider>(builder: (context, authProvider, _) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            Center(
              child: Container(
                height: 6,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'Forgot password',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Enter your email for the verification process, we will send reset link to change password.",
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            ),
            SizedBox(height: 26.0),
            buildTitle(title: "Email ID"),
            SizedBox(
              height: 10,
            ),
            AuthTextField(
              controller: authProvider.emailController,
              title: 'Enter Email ID',
              icon: Icon(Icons.email_outlined),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50)),
              onPressed: () {
                authProvider.resetEmailPassword(
                  context: context,
                );
              },
              child: const Text('Continue'),
            ),
            SizedBox(
              height: 26,
            )
          ],
        ),
      );
    });
  }
}
