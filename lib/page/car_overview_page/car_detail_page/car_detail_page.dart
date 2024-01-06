import 'package:car_rental_app/common/widget/address_direction_card.dart';
import 'package:car_rental_app/common/widget/app_small_button.dart';
import 'package:car_rental_app/common/widget/app_title.dart';
import 'package:car_rental_app/constants/app_theme.dart';
import 'package:car_rental_app/model/widget_model/car_model.dart';
import 'package:car_rental_app/page/car_overview_page/car_detail_page/widget/car_detail_feature_section.dart';
import 'package:car_rental_app/page/car_overview_page/car_detail_page/widget/car_detail_renter_section.dart';
import 'package:car_rental_app/page/car_overview_page/car_detail_page/widget/car_detail_review_section.dart';
import 'package:car_rental_app/page/car_overview_page/car_detail_page/widget/car_detail_top_bar.dart';
import 'package:car_rental_app/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../booking_detail_page/car_booking_page.dart';
import '../booking_summery_page/widget/payment_success.dart';

class CarDetailPage extends StatefulWidget {
  final CarModel carDetail;

  const CarDetailPage({super.key, required this.carDetail});

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Text(
                "₹" + widget.carDetail.ratePerHour.round().toString() + "/Day",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.black.withOpacity(.8)),
              ),
            ),
            SizedBox(
              width: 38,
            ),
            Expanded(
                child: ElevatedButton(
              child: Text("Rent now"),
              onPressed: () {
                NavigationService.push(page: CarBookingPage(carDetail: widget.carDetail,));
              },
            ))
          ],
        ),
      ),
      backgroundColor: AppTheme.lightSecondaryBgColor,
      appBar: AppBar(
        backgroundColor: AppTheme.lightSecondaryBgColor,
        title: Text(widget.carDetail.name),
        actions: [
          AppSmallButton(
              onTap: () {
                Share.share(widget.carDetail.name);
              },
              bgColor: Colors.white,
              fgColor: Colors.black,
              icon: Icons.share),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            CarDetailTopBar(carDetail: widget.carDetail),
            SizedBox(
              height: 18,
            ),
            CarDetailFeatureSection(features: widget.carDetail.features),
            SizedBox(
              height: 22,
            ),
            CarDetailRanterSection(),
            SizedBox(
              height: 22,
            ),
            CarDetailReviewSection(),
            SizedBox(
              height: 22,
            ),
            AppTitle(title: "Address"),
            SizedBox(
              height: 8,
            ),
            AddressDirectionCard(),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
