import 'package:flutter/material.dart';

class BenefitCard extends StatelessWidget {
  const BenefitCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> benefitList = [
      "What will I learn?",
      "What are the uses of C++?",
      "Benefits",
      "Salary",
      "Requirements"
    ];

    var fontColor = Colors.white.withOpacity(.99);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.blue.shade700, Colors.blue.shade700])),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "More about C++",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: fontColor,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ...benefitList
                    .map((benefit) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle_rounded,
                              color: fontColor,
                              size: 8,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              benefit,
                              style: TextStyle(
                                color: fontColor,
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ],
            ),
          ),
      // Image.network("https://res.cloudinary.com/jerrick/image/upload/v1548358184/i8uj1f1dquu5dc6rzkgs.gif"),
          Positioned(
           // right: -100,
            child: Image.asset("assets/icon/bg_partten.png",
              color: Colors.black,
              height: 150,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: Container(
              height: 42,
              width: 42,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
              decoration: BoxDecoration(
                  color: Colors.blue.shade50, shape: BoxShape.circle),
            ),
          )
        ],
      ),
    );
  }
}
