import 'package:car_rental_app/common/widget/app_small_button.dart';
import 'package:car_rental_app/page/main_page/home_page/widget/filter_page.dart';
import 'package:car_rental_app/service/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Ultimate Car Rental Experience at Your Fingertips.",
            style: TextStyle(
                color: Colors.black.withOpacity(.6),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
                wordSpacing: 2),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontWeight: FontWeight.w400),
                              hintText: "Find your car"),
                        ),
                      ),
                    ],
                  ),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              AppSmallButton(
                onTap: () {
                  NavigationService.push(page: FilterPage());
                },
                bgColor: Theme.of(context).primaryColor,
                fgColor: Colors.white,
                icon: Icons.filter_alt_outlined,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
