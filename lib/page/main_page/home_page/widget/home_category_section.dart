import 'package:car_rental_app/common/widget/app_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = ["App+", "SUV", "Sedan", "Hatchback", "Luxury"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitle(title: "Top Categories"),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 110,
          child: ListView.builder(
              itemCount: categoryList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Column(children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child:
                                Image.asset("assets/car/car_${index + 1}.jpeg"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        categoryList[index],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.8)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ]));
              }),
        ),
      ],
    );
  }
}
