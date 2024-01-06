import 'package:car_rental_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/address_box.dart';
import '../../../../healper/location_helper.dart';
import '../../../../model/widget_model/address_model.dart';
import '../../../../pacakges/locationpicker/lib/entities/location_result.dart';
import '../../../../pacakges/locationpicker/lib/place_picker.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<AddressModel> addressList = [
      AddressModel(
          name: 'Amit Kumar',
          address: '1234 Ganga Nagar, Sector 22, Delhi, 110001, India'),
      AddressModel(
          name: 'Priya Sharma',
          address: '5678 Rajaji Street, MG Road, Mumbai, 400001, India'),
      AddressModel(
          name: 'Rajesh Singh',
          address: '9876 Gandhi Avenue, Vivek Nagar, Bangalore, 560001, India'),
      AddressModel(
          name: 'Sneha Patel',
          address: '456 Jodhpur Road, Civil Lines, Jaipur, 302001, India'),
      AddressModel(
          name: 'Rahul Verma',
          address:
              '1011 Varanasi Lane, Cantonment Area, Lucknow, 226001, India'),
      AddressModel(
          name: 'Pooja Gupta',
          address: '1213 Chandni Chowk, Old City, Kolkata, 700001, India'),
      AddressModel(
          name: 'Anand Sharma',
          address: '1415 Kottayam Street, Fort Kochi, Kochi, 682001, India'),
    ];
    buildAddressCard({required AddressModel address}) {
      return Container(
        width: double.infinity,
        decoration: AppConstants.cardDecoration,
        padding: AppConstants.cardPadding.copyWith(bottom: 12, top: 12),
        margin: EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              address.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              address.address,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black.withOpacity(.7)),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
          onPressed: () async {
            var currLatLang =
                await LocationHelper.getCurrentLatLong(context: context);

            LocationResult result =
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlacePicker(
                          AppConstants.googleMapApi,
                          displayLocation: LatLng(
                              currLatLang.latitude, currLatLang.longitude),
                        )));
          },
          child: const Text('Add new address'),
        ),
      ),
      appBar: AppBar(
        title: Text("Address"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ...addressList
                .map((address) => buildAddressCard(address: address))
                .toList(),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
