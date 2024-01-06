import 'package:car_rental_app/healper/app_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class AddressDirectionCard extends StatelessWidget {
  const AddressDirectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    buildTitle({required String title}) {
      return Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(.8)),
          ),
        ],
      );
    }

    buildSubtitle({required String subtitle}) {
      return Text(subtitle,
          style: TextStyle(color: Colors.black.withOpacity(.7)));
    }

    return Container(
      decoration: AppConstants.cardDecoration,
      child: Stack(
        children: [
          Padding(
            padding:
                AppConstants.cardPadding.copyWith(bottom: 4, top: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(
                  title: "Pickup address",
                ),
                const SizedBox(
                  height: 2,
                ),
                buildSubtitle(
                  subtitle:
                      "27, Shankar Nagar Main Road, Raipur, 492007, Chhattisgarh, India",
                ),
                const SizedBox(
                  height: 16,
                ),
                buildTitle(
                  title: "My address",
                ),
                const SizedBox(
                  height: 2,
                ),
                buildSubtitle(
                  subtitle:
                      "8, Civil Lines, Main Road, Raipur, 492001, Chhattisgarh,India",
                ),
                const SizedBox(
                  height: 2,
                ),
                Center(
                  child: TextButton.icon(
                      icon: const Icon(Icons.directions),
                      onPressed: () {
                        AppHelper.openUrl(
                            url:
                                "https://www.google.com/maps/dir/21.2571,81.6296/21.2497,81.6050/");
                      },
                      label: const Text("View Direction")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
