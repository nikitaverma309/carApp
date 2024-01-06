import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:car_rental_app/page/main_page/notification_page/notification_page.dart';
import 'package:car_rental_app/page/main_page/profile_page/profile_page.dart';

import 'package:flutter/material.dart';

import 'history_page/history_page.dart';
import 'home_page/home_page.dart';

class MainPage extends StatefulWidget {
  final int? initialPage;

  static const routeName = "main-page";

  const MainPage({Key? key, this.initialPage}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;

  var items = [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.drive_eta_outlined, title: 'My Trip'),
    TabItem(icon: Icons.notifications_none, title: 'Notification'),
    TabItem(icon: Icons.person, title: 'Profile'),
  ];

  @override
  void initState() {
    currentIndex = widget.initialPage ?? 0;
    super.initState();
  }

  onBack() {
    setState(() {
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Theme.of(context).textTheme.labelMedium!.color == Colors.white;
    return Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: .5,
              color: Colors.grey.withOpacity(.2),
            ),
            BottomBarFloating(
              enableShadow: false,
              items: items,
              backgroundColor: Colors.white,
              color: Colors.black.withOpacity(.5),
              colorSelected: Colors.black,
              indexSelected: currentIndex,
              onTap: (int index) => setState(() {
                currentIndex = index;
              }),
              //  backgroundSelected: Colors.black,
            ),
          ],
        ),
        body: getIndex());
  }

  getIndex() {
    if (currentIndex == 0) {
      return HomePage();
    } else if (currentIndex == 1) {
      return HistoryPage();
    } else if (currentIndex == 2) {
      return NotificationPage();
    } else if (currentIndex == 3) {
      return ProfilePage();
    } else {
      return Container();
    }
  }
}
