import 'package:car_rental_app/constants/app_constants.dart';
import 'package:car_rental_app/model/widget_model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/widget/address_direction_card.dart';
import '../../../common/widget/app_title.dart';
import '../../../service/navigation_service.dart';
import '../booking_summery_page/booking_summery_page.dart';

class CarBookingPage extends StatefulWidget {
  final CarModel carDetail;

  const CarBookingPage({super.key, required this.carDetail});

  @override
  State<CarBookingPage> createState() => _CarBookingPageState();
}

class _CarBookingPageState extends State<CarBookingPage> {
  DateTime? startTime;

  DateTime? endTime;

  buildCar() {
    return Container(
      decoration: AppConstants.cardDecoration,
      padding: AppConstants.cardPadding
          .copyWith(top: 18, bottom: 18, left: 12, right: 12),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
               widget.carDetail.imgSrc),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.carDetail.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "₹" +
                        widget.carDetail.ratePerHour.toInt().toString() +
                        "/Day",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ))
        ],
      ),
    );
  }

  buildTextField({required TextEditingController controller}) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(border: InputBorder.none),
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
    );
  }

  buildTitle({required String title}) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(.7)),
    );
  }

  Future<DateTime?> showDateTimePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    initialDate ??= DateTime.now();
    firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
    lastDate ??= firstDate.add(const Duration(days: 365 * 200));

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate == null) return null;

    if (!context.mounted) return selectedDate;

    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    );

    return selectedTime == null
        ? selectedDate
        : DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 12, top: 8),
        child: ElevatedButton(
          onPressed: () {
            NavigationService.push(
                page: BookingSummeryPage(
              carDetail: widget.carDetail,
            ));
          },
          child: Text("Book car"),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Book car"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCar(),
            SizedBox(
              height: 12,
            ),
            buildTitle(title: "Name"),
            SizedBox(
              height: 4,
            ),
            buildTextField(
                controller: TextEditingController(text: "Nikita Verma")),
            SizedBox(
              height: 12,
            ),
            buildTitle(title: "Phone"),
            SizedBox(
              height: 4,
            ),
            buildTextField(
                controller: TextEditingController(text: "9669395879")),
            SizedBox(
              height: 12,
            ),
            buildTitle(title: "Start Date"),
            SizedBox(
              height: 4,
            ),
            InkWell(
              onTap: () async {
                startTime = await showDateTimePicker(context: context);
                setState(() {});
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      startTime == null
                          ? "Select Date"
                          : DateFormat('dd MMM yyyy, hh:mm a')
                              .format(startTime!),
                      style: TextStyle(
                          color: startTime == null
                              ? Colors.black.withOpacity(.5)
                              : Colors.black),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            buildTitle(title: "End Date"),
            SizedBox(
              height: 6,
            ),
            InkWell(
              onTap: () async {
                endTime = await showDateTimePicker(context: context);
                setState(() {});
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      endTime == null
                          ? "Select Date"
                          : DateFormat('dd MMM yyyy, hh:mm a').format(endTime!),
                      style: TextStyle(
                          color: endTime == null
                              ? Colors.black.withOpacity(.5)
                              : Colors.black),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            AppTitle(title: "Address"),
            SizedBox(
              height: 12,
            ),
            AddressDirectionCard(),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
