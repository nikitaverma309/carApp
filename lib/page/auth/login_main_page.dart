
import 'package:car_rental_app/page/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'login_page.dart';

class LoginMainPage extends StatefulWidget {
  const LoginMainPage({super.key});

  @override
  State<LoginMainPage> createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    buildHeader() {
      return Container(
        color: Colors.grey.withOpacity(.1),
        child: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            Image.asset(
              "assets/icon/app_icon.png",
              height: 50,
            ),
            SizedBox(
              height: 22,
            ),
            Align(
              alignment: Alignment.center,
              child: ToggleSwitch(
                borderColor: [
                  Theme.of(context).primaryColor.withOpacity(.2),
                  Theme.of(context).primaryColor.withOpacity(.2),
                ],
                borderWidth: 4,
                minWidth: 120,
                minHeight: 32,
                radiusStyle: true,
                customTextStyles: [
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ],
                initialLabelIndex: selectedTab,
                totalSwitches: 2,
                labels: const [
                  'Login',
                  'Register',
                ],
                onToggle: (index) {
                  print('switched to: $index');
                  setState(() {
                    selectedTab = index ?? 0;
                  });
                },
                activeBgColor: [
                  Colors.white,
                  Colors.white,
                ],
                activeFgColor: Colors.black,
                inactiveBgColor: Colors.transparent,
                inactiveFgColor: Colors.black,
                cornerRadius: 28,
              ),
            ),
            SizedBox(
              height: 22,
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        if (selectedTab == 0) {
          return true;
        } else {
          selectedTab = 0;
          setState(() {});
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
            body: SingleChildScrollView(
          child: Column(children: [
            buildHeader(),
            selectedTab == 0 ? LoginPage() : RegisterPage(),
          ]),
        )),
      ),
    );
  }
}
