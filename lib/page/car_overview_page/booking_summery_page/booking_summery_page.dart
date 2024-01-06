import 'package:car_rental_app/constants/app_constants.dart';
import 'package:car_rental_app/model/widget_model/car_model.dart';
import 'package:car_rental_app/page/car_overview_page/booking_summery_page/widget/car_summery_card.dart';
import 'package:car_rental_app/page/car_overview_page/booking_summery_page/widget/payment_success.dart';
import 'package:car_rental_app/page/car_overview_page/booking_summery_page/widget/price_summery_card.dart';
import 'package:car_rental_app/page/main_page/profile_page/pages/offer_page.dart';
import 'package:flutter/material.dart';

import '../../../common/widget/address_direction_card.dart';
import '../../../common/widget/app_title.dart';
import '../../../service/navigation_service.dart';

class BookingSummeryPage extends StatefulWidget {
  final CarModel carDetail;

  const BookingSummeryPage({super.key, required this.carDetail});

  @override
  State<BookingSummeryPage> createState() => _BookingSummeryPageState();
}

class _BookingSummeryPageState extends State<BookingSummeryPage> {
  @override
  Widget build(BuildContext context) {
    buildDetail({required String title, required String subtitle}) {
      return Row(
        children: [Text(title), Spacer(), Text(subtitle)],
      );
    }

    buildBookingDetails() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            buildDetail(title: "Name", subtitle: "Nikita Verma"),
            buildDetail(title: "Phone", subtitle: "9669395879"),
            buildDetail(title: "Start Date", subtitle: "12/008/2000"),
            buildDetail(title: "End Date", subtitle: "15/08/2000"),
          ],
        ),
      );
    }

    buildCouponCode() {
      return InkWell(
        onTap: () {
          NavigationService.push(page: OfferPage());
        },
        child: Container(
          width: double.infinity,
          decoration: AppConstants.cardDecoration,
          padding: AppConstants.cardPadding,
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                "Select coupon code",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 12, top: 8),
        child: ElevatedButton(
          onPressed: () {
            NavigationService.push(page: PaymentSuccessPage());
          },
          child: Text("Book car"),
        ),
      ),
      appBar: AppBar(
        title: Text("Booking Summery"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            CarSummeryCard(
              carModel: widget.carDetail,
            ),
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
            AppTitle(title: "Coupon code"),
            SizedBox(
              height: 12,
            ),
            buildCouponCode(),
            SizedBox(
              height: 24,
            ),
            AppTitle(title: "Price summery"),
            SizedBox(
              height: 12,
            ),
            PriceSummeryCard(),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
