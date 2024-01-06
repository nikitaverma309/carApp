import 'package:car_rental_app/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceSummeryCard extends StatelessWidget {
  const PriceSummeryCard({super.key});

  @override
  Widget build(BuildContext context) {
    buildDetail({required String title, required String subtitle}) {
      return Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(.7)),
          ),
          Spacer(),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          )
        ],
      );
    }

    return Container(
      decoration: AppConstants.cardDecoration,
      padding: AppConstants.cardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          buildDetail(title: 'Rent', subtitle: "₹" "2000.00"),
          SizedBox(
            height: 12,
          ),
          buildDetail(title: 'Tax & Fees', subtitle: "₹" "300.00"),
          SizedBox(
            height: 12,
          ),
          buildDetail(title: 'Coupon applied', subtitle: "₹" "-200.00"),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(.2),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                "Total",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "₹" "2300.00",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
