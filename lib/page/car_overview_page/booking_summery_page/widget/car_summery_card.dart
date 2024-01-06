import 'package:car_rental_app/common/widget/app_title.dart';
import 'package:car_rental_app/constants/app_constants.dart';
import 'package:car_rental_app/healper/app_helper.dart';
import 'package:car_rental_app/model/widget_model/car_model.dart';
import 'package:car_rental_app/page/car_overview_page/car_detail_page/car_detail_page.dart';
import 'package:car_rental_app/service/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

class CarSummeryCard extends StatefulWidget {
  final CarModel carModel;

  const CarSummeryCard({super.key, required this.carModel});

  @override
  State<CarSummeryCard> createState() => _CarSummeryCardState();
}

class _CarSummeryCardState extends State<CarSummeryCard> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 10;
    Color iconColor = Colors.black.withOpacity(.5);
    var car = widget.carModel;

    buildCircle() {
      return Container(
        height: iconSize,
        width: iconSize,
        decoration: BoxDecoration(shape: BoxShape.circle, color: iconColor),
      );
    }

    buildTimeLine() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              buildCircle(),
              SizedBox(
                width: 12,
              ),
              Text(
                "Start Date: ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(AppHelper.getFormattedDateTime(date: DateTime(2023, 08, 12)))
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: iconSize / 2.7),
            height: 18,
            width: 2,
            color: iconColor,
          ),
          Row(
            children: [
              buildCircle(),
              SizedBox(
                width: 12,
              ),
              Text(
                "End Date: ",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(AppHelper.getFormattedDateTime(date: DateTime(2000, 08, 15)))
            ],
          ),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: AppConstants.cardPadding,
          decoration: AppConstants.cardDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          car.imgSrc,
                        ),
                      )),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "₹ ${car.ratePerHour.toInt()}/ Hr",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(.6)),
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.phone_fill,
                                size: 14,
                                color: Colors.black.withOpacity(.6),
                              ),
                              Text(
                                "9669395879",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: .5,
                width: double.infinity,
                color: Colors.black.withOpacity(.2),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    "Booked by: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Nikita verma",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(.8)),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              buildTimeLine(),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
