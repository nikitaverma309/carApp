import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class AppConstants {
  static const playStoreUrl =
      "https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox";

  static const googleMapApi = "AIzaSyB6pOBFdaz8h0z9uwhN7rqlr1fg0VrCtzc";
  static var cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    color: Colors.white,
    // boxShadow: [
    //   BoxShadow(
    //     color: Colors.grey.withOpacity(0.1),
    //     spreadRadius: 5,
    //     blurRadius: 7,
    //     offset: Offset(0, 3),
    //   ),
    // ],
  );

  static var cardPadding = EdgeInsets.symmetric(horizontal: 18);

  static String timeAgo({required DateTime dateTime}){

    return timeago.format(dateTime, locale: 'en_short');
  }
}
