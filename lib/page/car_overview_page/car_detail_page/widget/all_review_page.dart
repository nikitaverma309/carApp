import 'package:car_rental_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../model/widget_model/review_model.dart';

class AllReviewPage extends StatefulWidget {
  const AllReviewPage({super.key});

  @override
  State<AllReviewPage> createState() => _AllReviewPageState();
}

class _AllReviewPageState extends State<AllReviewPage> {
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
    buildReviewCard({required ReviewModel review}) {
      return Container(
        height: 150,
        decoration: AppConstants.cardDecoration,
        margin: EdgeInsets.only(
          right: 16,
          bottom: 18,
          left: 16,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  foregroundColor: Colors.white,
                  radius: 16,
                  child: Text(review.name[0]),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  review.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
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
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ...reviewList.map((review) => buildReviewCard(review: review))
          ],
        ),
      ),
    );
  }
}
