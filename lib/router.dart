
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {


    // case FAQPage.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => FAQPage(),
    //   );


    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("route not implemented "),
                ),
              ));
  }
}
