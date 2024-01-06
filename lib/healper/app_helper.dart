import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHelper {
  static final logger = Logger();

  static getToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,

        //    textColor: Colors.white,
        fontSize: 16.0);
  }

  static getSnackBar({required BuildContext context, required String msg}) {
    final snackBar = SnackBar(content: Text(msg));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> openUrl({required String url}) async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      print("error launching url : $e");
    }
  }

  static String getFormattedDate({required DateTime date}) {
    return DateFormat('dd MMM, yyyy').format(date);
  }

  static String getFormattedTime({required DateTime date}) {
    return DateFormat('h:mm a').format(date);
  }

  static getFormattedDateTime({required DateTime date}) {
    return DateFormat('dd MMM, yyyy, h:mm a').format(date);
  }

  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegex.hasMatch(password);
  }
}
