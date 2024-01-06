import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  String? message;

  AppLoadingIndicator({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Dialog(
        child: Container(
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Theme.of(context).cardColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Row(
            children: [
              Spacer(),
              const CircularProgressIndicator(),
              const SizedBox(
                width: 32,
              ),
              Text(
                message ?? "Loading" + "...",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
