import 'package:car_rental_app/common/widget/app_small_button.dart';
import 'package:car_rental_app/page/main_page/home_page/widget/car_home_card.dart';
import 'package:car_rental_app/page/main_page/home_page/widget/home_category_section.dart';
import 'package:car_rental_app/page/main_page/home_page/widget/home_top_bar.dart';
import 'package:car_rental_app/service/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../common/widget/address_box.dart';
import '../../../common/widget/app_title.dart';
import '../../../model/widget_model/car_model.dart';
import '../notification_page/notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AddressBar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffF7F7F7),
        title: Row(
          children: [
            Text(
              "Go ",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.red.shade800),
            ),
            Text(
              "Rent",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.blue.shade900),
            )
          ],
        ),
        // actions: [
        //   AppSmallButton(
        //       onTap: () {
        //         NavigationService.push(page: NotificationPage());
        //       },
        //       bgColor: Colors.white,
        //       fgColor: Colors.black.withOpacity(.8),
        //       icon: Icons.notifications_none),
        //   SizedBox(
        //     width: 16,
        //   )
        // ],
      ),
      backgroundColor: Color(0xffF7F7F7),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTopBar(),
            SizedBox(
              height: 8,
            ),
            HomeCategorySection(),
            SizedBox(
              height: 8,
            ),
            const AppTitle(title: "Popular car"),
            SizedBox(
              height: 4,
            ),
            ...carList.map((car) => CarHomeCard(carModel: car))
          ],
        ),
      ),
    );
  }
}
