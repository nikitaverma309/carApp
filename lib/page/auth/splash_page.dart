 import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../service/navigation_service.dart';
import '../main_page/main_page.dart';
import 'splash_screen/feature_showcase_papge.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    await Future.delayed(Duration(seconds: 0));
    var user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      NavigationService.pushReplacement(newPage: FeatureShowCasePage());
    } else {
      NavigationService.pushReplacement(newPage: MainPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff192028),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon/app_icon.png",
                height: 100,
                width: 100,
              ),
            ],
          ),
        ));
  }
}
