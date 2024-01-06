import 'package:flutter/material.dart';

class PaymentFailurePagae extends StatelessWidget {
  const PaymentFailurePagae({super.key});

  @override
  Widget build(BuildContext context) {
    buildDetail({required String title, required String subtitle}) {
      return Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(.7)),
          ),
          Spacer(),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Spacer(
              flex: 3,
            ),
            Image.network(
              "https://cdn-icons-png.flaticon.com/128/463/463612.png",
              height: 60,
              width: 60,
            ),
            Spacer(),
            Text(
              "Payment success",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your payment was successful and you can start reading your books whenever you want.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(.6),
                letterSpacing: 1.0,
                height: 1.5,
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(28)),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 28),
              child: Column(
                children: [
                  buildDetail(title: 'Rent', subtitle: "₹" + "2000.00"),
                  SizedBox(
                    height: 22,
                  ),
                  buildDetail(title: 'Tax & Fees', subtitle: "₹" + "300.00"),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey.withOpacity(.2),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 15, color: Colors.black.withOpacity(.7)),
                      ),
                      Spacer(),
                      Text(
                        "₹" + "2300.00(FAILED)",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 4,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade900,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28))),
                onPressed: () {},
                child: const Text("Continue")),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
