import 'package:car_rental_app/page/main_page/history_page/widget/car_trip_card.dart';
import 'package:flutter/material.dart';
import '../../../model/widget_model/car_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My trip"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [...carList.map((car) => CarTripCard(carModel: car))],
        ),
      ),
    );
  }
}
