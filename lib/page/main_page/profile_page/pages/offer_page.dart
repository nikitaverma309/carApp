import 'package:flutter/material.dart';

List<OfferModel> offerList = [
  OfferModel(
    offerCode: 'EXTEND15',
    title: 'Extended Rental Discount',
    validDate: DateTime(2023, 12, 15),
    description: 'Enjoy 15% off on rentals of 7 days or more.',
  ),
  OfferModel(
    offerCode: 'FIRST25',
    title: 'First-Time User Special',
    validDate: DateTime(2023, 12, 20),
    description: 'New users get a flat 25% discount on their first booking.',
  ),
  OfferModel(
    offerCode: 'REFER15',
    title: 'Refer a Friend',
    validDate: DateTime(2023, 12, 25),
    description: 'Refer a friend and both get 15% off on your next bookings.',
  ),
  OfferModel(
    offerCode: 'HOLIDAY10',
    title: 'Holiday Special',
    validDate: DateTime(2023, 12, 31),
    description: 'Book during the holiday season and get a 10% discount.',
  ),
  OfferModel(
    offerCode: 'BIZ15',
    title: 'Business Traveler Discount',
    validDate: DateTime(2024, 1, 5),
    description:
        'Business travelers receive a 15% discount on weekday rentals.',
  ),
  OfferModel(
    offerCode: 'FAMILY20',
    title: 'Family Vacation Deal',
    validDate: DateTime(2024, 1, 10),
    description: 'Families save 20% on minivan or SUV rentals.',
  ),
  OfferModel(
    offerCode: 'FREERENT',
    title: 'Frequent Renter Program',
    validDate: DateTime(2024, 1, 15),
    description: 'Rent 5 times, get the 6th rental free.',
  ),
  OfferModel(
    offerCode: 'APP10',
    title: 'App Exclusive',
    validDate: DateTime(2024, 1, 20),
    description: 'Exclusive 10% discount for bookings made through the app.',
  ),
];

class OfferPage extends StatefulWidget {
  static const routeName = "Offer-page";

  const OfferPage({super.key});

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  List<Color> colorList = [
    Colors.red,
    Colors.blue.shade800,
    Colors.pink,
    Colors.purple,
    Colors.orange,
    Colors.blueGrey
  ];

  buildCard({required OfferModel offer, required int index}) {
    final color = colorList[index % (colorList.length - 1)];

    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 18),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Transform.rotate(
                angle: 270 * 3.14159 / 180,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: color.withOpacity(.2),
                      borderRadius: BorderRadius.circular(18)),
                  child: Text(
                    offer.offerCode,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                )),
          ),
          Expanded(
              flex: 5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                        color: Color(0xffF2F1EF).withOpacity(.8),
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          offer.title,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          offer.validDate.toString(),
                          style: TextStyle(
                              color: color, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          offer.description,
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.copy,
                        color: color,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offer"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ...offerList
                .map((Offer) =>
                    buildCard(offer: Offer, index: offerList.indexOf(Offer)))
                .toList()
          ],
        ),
      ),
    );
  }
}

class OfferModel {
  final String offerCode;
  final String title;
  final DateTime validDate;
  final String description;

  OfferModel(
      {required this.offerCode,
      required this.title,
      required this.validDate,
      required this.description});
}
