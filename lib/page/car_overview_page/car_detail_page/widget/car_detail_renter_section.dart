import 'package:car_rental_app/common/widget/app_title.dart';
import 'package:car_rental_app/constants/app_constants.dart';
import 'package:car_rental_app/healper/app_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDetailRanterSection extends StatelessWidget {
  const CarDetailRanterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTitle(title: "Renter"),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: AppConstants.cardDecoration,
          padding: AppConstants.cardPadding
              .copyWith(right: 8, left: 8, top: 8, bottom: 8),
          child: Row(
            children: [
              CircleAvatar(
                child: Text("J"),
                backgroundColor: Colors.grey.shade800,
                foregroundColor: Colors.white,
                radius: 18,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Jason Smith",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              IconButton(
                  onPressed: ()   {
                    String url = 'tel:1234567890';
                    AppHelper.openUrl(url: url);
                  },
                  icon: Icon(
                    Icons.phone_outlined,
                    color: Colors.blue.shade800,
                  )),
              IconButton(
                  onPressed: () {
                    String url = 'sms:1234567890';
                    AppHelper.openUrl(url: url);
                  },
                  icon: Icon(
                    Icons.message_outlined,
                    color: Colors.blue.shade800,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
