import 'package:car_rental_app/common/widget/app_title.dart';
import 'package:car_rental_app/model/widget_model/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDetailTopBar extends StatefulWidget {
  final CarModel carDetail;

  const CarDetailTopBar({super.key, required this.carDetail});

  @override
  State<CarDetailTopBar> createState() => _CarDetailTopBarState();
}

class _CarDetailTopBarState extends State<CarDetailTopBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(widget.carDetail.imgSrc)),
        SizedBox(
          height: 12,
        ),
        AppTitle(title: "Overview"),
        Text(
          "The Tata Nexon became the first Indian vehicle to score a perfect five stars in the GNCAP test establishing a new benchmark for the automotive market.",
          textAlign: TextAlign.justify,   style: TextStyle(
              fontSize: 15,

              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(.6)),
        )
      ],
    );
  }
}
