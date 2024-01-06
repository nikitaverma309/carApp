import 'package:car_rental_app/model/widget_model/car_model.dart';
import 'package:car_rental_app/page/car_overview_page/car_detail_page/car_detail_page.dart';
import 'package:car_rental_app/service/navigation_service.dart';
import 'package:flutter/material.dart';

class CarHomeCard extends StatefulWidget {
  final CarModel carModel;

  const CarHomeCard({super.key, required this.carModel});

  @override
  State<CarHomeCard> createState() => _CarHomeCardState();
}

class _CarHomeCardState extends State<CarHomeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: 145,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Image.asset(
                    widget.carModel.imgSrc,
                    fit: BoxFit.cover,
                    height: 150,
                  )),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                          widget.carModel.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        Text(
                          "₹" +
                              widget.carModel.ratePerHour.round().toString() +
                              "/Hr",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black.withOpacity(.7)),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              "4.5",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(.8)),
                            ),
                            Spacer(),
                            Icon(
                              size: 8,
                              Icons.circle,
                              color: Colors.grey.withOpacity(.5),
                            ),
                            Spacer(),
                            Text(
                              "31 Review",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(.8)),
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  NavigationService.push(
                                      page: CarDetailPage(
                                          carDetail: widget.carModel));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  child: Text(
                                    "Rent now",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.grey.shade900),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  widget.carModel.isFavourite =
                                      !widget.carModel.isFavourite;
                                  setState(() {});
                                },
                                icon: Icon(
                                  widget.carModel.isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
