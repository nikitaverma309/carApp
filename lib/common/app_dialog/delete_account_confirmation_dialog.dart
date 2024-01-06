import 'package:flutter/material.dart';

class DeleteAccountDialog extends StatefulWidget {
  const DeleteAccountDialog({Key? key}) : super(key: key);

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {



    return AlertDialog(
      title: const Text("Delete account"),
      content: const Text(
          "Are you sure you want to delete account?"),
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
            child: const Text("No")),
      ],
    );
  }
}
