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

String ManualAddress = '';
String _currentAddress = "";

class _GoogleLocationState extends State<GoogleLocation> {
  Position? _currentLocation;

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
          _currentLocation!.latitude, _currentLocation!.longitude);
      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            's${place.street}, ${place.subLocality}, ${place.locality}-${place.postalCode}, ${place.country}';
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
            //     "Latitude = ${_currentLocation?.latitude}; Longitude = ${_currentLocation?.longitude}"),
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
                _currentLocation = await _getCurrentLocation();
                await _getAddressFromCordinates();

                print("${_currentLocation}");
                ManualAddress = _currentAddress;
                print("${_currentAddress}");
                Get.offAll(
                  () => Dashboard(),
                  arguments: _currentAddress,
                );
              },
              child: Center(
                  child: Text(
                "Get Current Location",
                style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            // Bounce(
            //   duration: Duration(milliseconds: 300),
            //   onPressed: () {
            //     showModalBottomSheet(
            //       backgroundColor: Color(0xfff4ebdc),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadiusDirectional.only(
            //               topEnd: Radius.circular(20),
            //               topStart: Radius.circular(20))),
            //       showDragHandle: true,
            //       enableDrag: true,
            //       // enableDrag: true,
            //       // showDragHandle: true,
            //       isScrollControlled: true,
            //
            //       constraints: BoxConstraints(minHeight: 50, maxHeight: 450),
            //
            //       context: context,
            //       builder: (BuildContext context) {
            //         return Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             children: [
            //               TextFormField(
            //                 controller: te,
            //
            //                 // expands: true,
            //                 maxLines: 3,
            //                 minLines: 1,
            //                 autofocus: true,
            //                 // keyboardType: TextInputType.number,
            //
            //                 cursorColor: AppColors.Colorq,
            //                 style: const TextStyle(
            //                   fontSize: 18,
            //                   fontWeight: FontWeight.bold,
            //                   color: AppColors.Colorq,
            //                 ),
            //                 onChanged: (value) {
            //                   ManualAddress = value;
            //                   setState(() {});
            //                 },
            //                 decoration: InputDecoration(
            //                   hoverColor: Colors.black,
            //                   prefixIcon: Icon(
            //                     Icons.location_on,
            //                     color: AppColors.Colorq,
            //                   ),
            //                   // fillColor: const Color(0xff2C474A),
            //                   // filled: true,
            //                   hintText: "Type Address Here",
            //
            //                   hintStyle: TextStyle(
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 16,
            //                     color: AppColors.Colorq.withOpacity(0.9),
            //                   ),
            //                   floatingLabelBehavior:
            //                       FloatingLabelBehavior.never,
            //                   contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
            //                   border: OutlineInputBorder(
            //                       borderRadius: BorderRadius.circular(100.0),
            //                       borderSide:
            //                           BorderSide(color: AppColors.Colorq)),
            //
            //                   focusedBorder: OutlineInputBorder(
            //                       borderRadius: BorderRadius.circular(100.0),
            //                       borderSide: BorderSide(
            //                           color: AppColors.Colorq, width: 2)),
            //                   enabledBorder: OutlineInputBorder(
            //                       borderRadius: BorderRadius.circular(100.0),
            //                       borderSide: BorderSide(
            //                           color: AppColors.Colorq, width: 2)),
            //                   // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
            //                   // focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 120,
            //               ),
            //               Bounce(
            //                 onPressed: () {
            //                   _currentAddress = te.text.toString();
            //                   Get.offAll(Dashboard(), arguments: te.text);
            //                 },
            //                 duration: Duration(milliseconds: 300),
            //                 child: Container(
            //                   height: 50,
            //                   width: 220,
            //                   child: Center(
            //                       child: Text(
            //                     "Set Location",
            //                     style: GoogleFonts.poppins(
            //                         fontSize: 24, color: Colors.white),
            //                   )),
            //                   decoration: BoxDecoration(
            //                     color: AppColors.Colorq,
            //                     borderRadius: BorderRadius.circular(25),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //             // height: 400,
            //             // decoration: BoxDecoration(
            //             //     color: Colors.white,
            //             //     borderRadius: BorderRadius.only(
            //             //         topLeft: Radius.circular(20),
            //             //         topRight: Radius.circular(20))),
            //             //  Column(
            //             //   mainAxisAlignment: MainAxisAlignment.start,
            //             //   mainAxisSize: MainAxisSize.min,
            //             //   children: <Widget>[
            //             //     TextFormField(
            //             //       // expands: true,
            //             //       maxLines: 3,
            //             //       minLines: 1,
            //             //       keyboardType: TextInputType.number,
            //             //       cursorColor: AppColors.mainBrown,
            //             //       style: const TextStyle(
            //             //         fontSize: 18,
            //             //         fontWeight: FontWeight.bold,
            //             //         color: AppColors.mainBrown,
            //             //       ),
            //             //       onChanged: (value) {
            //             //         setState(() {});
            //             //       },
            //             //       decoration: InputDecoration(
            //             //         // fillColor: const Color(0xff2C474A),
            //             //         // filled: true,
            //             //         hintText: "Type Address Here",
            //             //
            //             //         hintStyle: TextStyle(
            //             //           fontWeight: FontWeight.w500,
            //             //           fontSize: 16,
            //             //           color: AppColors.mainBrown.withOpacity(0.9),
            //             //         ),
            //             //         floatingLabelBehavior:
            //             //             FloatingLabelBehavior.never,
            //             //         contentPadding:
            //             //             EdgeInsets.fromLTRB(5, 10, 5, 0),
            //             //         focusedBorder: OutlineInputBorder(
            //             //             borderRadius: BorderRadius.circular(100.0),
            //             //             borderSide: BorderSide(
            //             //                 color: AppColors.mainOrange)),
            //             //         enabledBorder: OutlineInputBorder(
            //             //             borderRadius: BorderRadius.circular(100.0),
            //             //             borderSide:
            //             //                 BorderSide(color: Color(0xff4c1514))),
            //             //         // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
            //             //         // focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
            //             //       ),
            //             //     ),
            //             //     SizedBox(
            //             //       height: 10,
            //             //     ),
            //             //     Container(
            //             //       height: 50,
            //             //       width: 300,
            //             //       child: Center(
            //             //           child: Text(
            //             //         "Set Location",
            //             //         style: GoogleFonts.poppins(
            //             //             fontSize: 24, color: Colors.white),
            //             //       )),
            //             //       decoration: BoxDecoration(
            //             //         color: AppColors.mainOrange,
            //             //         borderRadius: BorderRadius.circular(25),
            //             //       ),
            //             //     ),
            //             //   ],
            //             // ),
            //           ),
            //         );
            //       },
            //     );
            //   },
            //   child: Text(
            //     "Enter Location Manually",
            //     style: GoogleFonts.poppins(
            //         fontSize: 24,
            //         color: AppColors.Colorq,
            //         fontWeight: FontWeight.w400),
            //   ),
            // ),
            // ElevatedButton(
            //     onPressed: () async {
            //       _currentLocation = await _getCurrentLocation();
            //       await _getAddressFromCordinates();
            //
            //       print("${_currentLocation}");
            //       print("${_currentAddress}");
            //       Get.to(()=>bottomNavigation(),arguments: _currentAddress);
            //     },
            //     child: Text("get Location"))
          ],
        ),
      ),
    );
  }
}
