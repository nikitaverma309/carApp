import 'package:car_rental_app/model/widget_model/car_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_constants.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    buildCar({required CarModel carDetail}) {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(bottom: 12),
            decoration: AppConstants.cardDecoration,
            padding: AppConstants.cardPadding
                .copyWith(top: 18, bottom: 18, left: 12, right: 12),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(carDetail.imgSrc),
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
                          carDetail.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "₹" +
                              carDetail.ratePerHour.toInt().toString() +
                              "/Day",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              "4.5",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(.8)),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 22,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "|",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(.8)),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "31 Review",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(.8)),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Positioned(
              right: 24,
              top: 4,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.withOpacity(.1)),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 22,
                ),
              ))
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...carList.map((car) => buildCar(carDetail: car)).toList()
          ],
        ),
      ),
    );
  }
}
