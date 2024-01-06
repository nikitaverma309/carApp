import 'package:car_rental_app/common/widget/app_title.dart';
import 'package:car_rental_app/constants/app_constants.dart';
import 'package:car_rental_app/page/car_overview_page/car_detail_page/widget/all_review_page.dart';
import 'package:car_rental_app/service/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../model/widget_model/review_model.dart';

class CarDetailReviewSection extends StatefulWidget {
  const CarDetailReviewSection({super.key});

  @override
  State<CarDetailReviewSection> createState() => _CarDetailReviewSectionState();
}

class _CarDetailReviewSectionState extends State<CarDetailReviewSection> {
  List<ReviewModel> reviewList = [
    ReviewModel(
      name: 'John Doe',
      comment:
          "Great experience with the car rental service. Everything went smoothly.",
      rating: 5,
      time: DateTime.now().subtract(Duration(days: 7)),
    ),
    ReviewModel(
      name: 'Jane Smith',
      comment:
          "Nice selection of cars and convenient booking process. Will recommend!",
      rating: 4,
      time: DateTime.now().subtract(Duration(days: 14)),
    ),
    ReviewModel(
      name: 'David Johnson',
      comment: "Professional staff and clean cars. Made my trip enjoyable.",
      rating: 5,
      time: DateTime.now().subtract(Duration(days: 21)),
    ),
    ReviewModel(
      name: 'Emily Davis',
      comment:
          "Efficient check-in/out and helpful customer support. Will use again.",
      rating: 4,
      time: DateTime.now().subtract(Duration(days: 28)),
    ),
    ReviewModel(
      name: 'Michael Wilson',
      comment:
          "Reliable GPS system in the car. It made navigation hassle-free.",
      rating: 5,
      time: DateTime.now().subtract(Duration(days: 35)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    buildReviewCard({required ReviewModel review}) {
      return Container(
        width: width * .7,
        margin: EdgeInsets.only(right: 18),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              review.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Row(
              children: [
                ...List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    color: index < review.rating
                        ? Colors.amber.shade600.withOpacity(.6)
                        : Colors.grey.withOpacity(.2),
                    size: 22,
                  );
                }),
              ],
            ),
            Spacer(),
            Text(
              review.comment,
              maxLines: 3,
            ),
            Spacer(),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
      );
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTitle(title: "Review"),
            Spacer(),
            Text(
              "4.5",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black.withOpacity(.8)),
            ),
            Text(
              " (11 Reviews)",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black.withOpacity(.8)),
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...reviewList.map((review) => buildReviewCard(review: review)),
                InkWell(
                  onTap: () {
                    NavigationService.push(page: AllReviewPage());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: AppConstants.cardDecoration,
                    //   padding: AppConstants.cardPadding,
                    child: Transform.rotate(
                      angle: 270 * 3.14159 / 180,
                      child: Row(
                        children: [
                          Text(
                            "View More",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.blue.shade800),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
