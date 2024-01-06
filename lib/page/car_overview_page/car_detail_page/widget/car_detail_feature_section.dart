import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/app_title.dart';
import '../../../../model/widget_model/car_model.dart';


class CarDetailFeatureSection extends StatelessWidget {
  final List<CarFeature> features;

  const CarDetailFeatureSection({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        AppTitle(title: "Specification"),
        SizedBox(
          height: 8,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: features.length,
          itemBuilder: (BuildContext context, int index) {
            var feature = features[index];
            return Container(
              width: 100,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18)),
              child: Column(
                children: [
                  Image.asset(
                    feature.iconImg,
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    feature.value,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text(feature.title)
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
