

import 'package:flutter/material.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: const Text("Log out"),
      content: const Text(
          "Are you sure you want to Logout?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text("Yes")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context)
                    .primaryColor,
                foregroundColor: Colors.white),
            child: Text("No")),
      ],
    );
  }
}
