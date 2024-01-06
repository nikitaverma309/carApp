import 'package:car_rental_app/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../healper/location_helper.dart';
import '../../pacakges/locationpicker/lib/entities/location_result.dart';
import '../../pacakges/locationpicker/lib/place_picker.dart';

class AddressBar extends StatefulWidget {
  const AddressBar({super.key});

  @override
  State<AddressBar> createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var currLatLang =
            await LocationHelper.getCurrentLatLong(context: context);

        LocationResult result =
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PlacePicker(
                      AppConstants.googleMapApi,
                      displayLocation:
                          LatLng(currLatLang.latitude, currLatLang.longitude),
                    )));

        if (result.latLng == null) {
          return;
        }

        String place = await LocationHelper.getLocationNameFromLatLong(
            lat: result.latLng!.latitude, long: result.latLng!.longitude);

        setState(() {
          selectedLocation = place;
        });
        print(place);

        return;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey.withOpacity(.2),
          ),
          FutureBuilder(
              future: LocationHelper.getCurrentAddressName(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey.shade700,
                          size: 22,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(
                          selectedLocation == null
                              ? snapshot.data.toString()
                              : selectedLocation.toString(),
                          style: TextStyle(
                              color: Colors.grey.shade700, fontWeight: FontWeight.w500,fontSize: 15),
                        ),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey.shade700,
                        )
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(.1),
                      highlightColor: Colors.white.withOpacity(.1),
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
