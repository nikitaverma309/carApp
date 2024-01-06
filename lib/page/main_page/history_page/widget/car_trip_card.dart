import 'package:car_rental_app/common/widget/app_title.dart';
import 'package:car_rental_app/constants/app_constants.dart';
import 'package:car_rental_app/healper/app_helper.dart';
import 'package:car_rental_app/model/widget_model/car_model.dart';
import 'package:car_rental_app/page/car_overview_page/car_detail_page/car_detail_page.dart';
import 'package:car_rental_app/page/main_page/history_page/page/trip_detail_page.dart';
import 'package:car_rental_app/service/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

class CarTripCard extends StatefulWidget {
  final CarModel carModel;

  const CarTripCard({super.key, required this.carModel});

  @override
  State<CarTripCard> createState() => _CarTripCardState();
}

class _CarTripCardState extends State<CarTripCard> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 10;
    Color iconColor = Colors.black.withOpacity(.5);
    var car = widget.carModel;
    DateTime myDate = DateTime(2024, 12, 26);

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
        child: InkWell(
          onTap: () {
            NavigationService.push(
                page: TripDetailPage(carDetail: widget.carModel));
          },
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
                            Text(
                              "Completed",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
