import 'package:car_rental_app/healper/app_helper.dart';
import 'package:car_rental_app/model/widget_model/car_model.dart';
import 'package:car_rental_app/page/main_page/history_page/widget/car_trip_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/address_direction_card.dart';
import '../../../../common/widget/app_title.dart';
import '../../../car_overview_page/booking_summery_page/widget/price_summery_card.dart';

class TripDetailPage extends StatefulWidget {
  final CarModel carDetail;

  const TripDetailPage({super.key, required this.carDetail});

  @override
  State<TripDetailPage> createState() => _TripDetailPageState();
}

class _TripDetailPageState extends State<TripDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
          onPressed: () {
            AppHelper.getSnackBar(context: context,msg: "Downloading...");
          },
          child: const Text('Download Invoice'),
        ),
      ),
      appBar: AppBar(
        title: Text("Trip detail"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CarTripCard(carModel: widget.carDetail),
            SizedBox(
              height: 12,
            ),
            AppTitle(title: "Address"),
            SizedBox(
              height: 12,
            ),
            AddressDirectionCard(),
            SizedBox(
              height: 24,
            ),
            AppTitle(title: "Price summery"),
            SizedBox(
              height: 12,
            ),
            PriceSummeryCard(),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
