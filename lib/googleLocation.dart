import 'package:city_serve/navigationBar.dart';
import 'package:city_serve/src/page/dashboard.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleLocation extends StatefulWidget {
  const GoogleLocation({super.key});

  @override
  State<GoogleLocation> createState() => _GoogleLocationState();
}

String currentLocation = '';
String _currentAddress = "";

class _GoogleLocationState extends State<GoogleLocation> {
  Position? fetchLocation;

  late bool servicePermission = false;
  late LocationPermission permission;
  TextEditingController te = TextEditingController();


  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("service disabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  _getAddressFromCordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          fetchLocation!.latitude, fetchLocation!.longitude);
      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.locality}-${place.postalCode}, ${place.country}';
        // "${place.street},${place.subAdministrativeArea},${place.subLocality},${place.thoroughfare},${place.postalCode},${place.country},";
        // "${place.street},${place.thoroughfare},${place.subLocality},${place.locality},${place.country},";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd6c1a8),
      body: Center(
        child: Column(
          children: [
            // Text(
            //   "Location CoodinateS",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //     "Latitude = ${fetchLocation?.latitude}; Longitude = ${fetchLocation?.longitude}"),
            // SizedBox(
            //   height: 30,
            // ),
            //
            //
            // Text("${_currentAddress}"),
            Container(
              width: 300,
            ),
            SizedBox(
              height: 50,
            ),
            Bounce(
              duration: Duration(milliseconds: 300),
              onPressed: () async {
                Get.defaultDialog(
                  content:CircularProgressIndicator(),
                );
                fetchLocation = await _getCurrentLocation();

                await _getAddressFromCordinates();

                print("${fetchLocation}");
                currentLocation = _currentAddress;
                print("${_currentAddress}");
                Get.offAll(
                  () => NavigationBarr(),
                  // arguments: _currentAddress,
                );
              },
              child: Center(
                  child: Text(
                "TAp",
                style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
              )),
            ),

          ],
        ),
      ),
    );
  }
}
