import 'package:city_serve/navigationBar.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
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
bool googleLocationLoad = false;

class _GoogleLocationState extends State<GoogleLocation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController _addressController = TextEditingController();

  Future<void> _initializeLocation() async {
    fetchLocation = await _getCurrentLocation();
    await _getAddressFromCordinates();
    print("${fetchLocation}");
    currentLocation = _currentAddress;
    print("${_currentAddress}");
    googleLocationLoad = false;
    Get.offAll(
      () => NavigationBarr(),
    );
    setState(() {});
  }

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
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bounce(
                  //   duration: Duration(milliseconds: 300),
                  //   onPressed: () async {
                  //     Get.defaultDialog(
                  //       content: CircularProgressIndicator(),
                  //     );
                  //     fetchLocation = await _getCurrentLocation();
                  //
                  //     await _getAddressFromCordinates();
                  //
                  //     print("${fetchLocation}");
                  //     currentLocation = _currentAddress;
                  //     print("${_currentAddress}");
                  //     Get.offAll(
                  //       () => NavigationBarr(),
                  //       // arguments: _currentAddress,
                  //     );
                  //   },
                  //   child: Center(
                  //       child: CircularProgressIndicator(
                  //     strokeCap: StrokeCap.round,
                  //     color: AppColors.Colorq,
                  //   )),
                  // ),
                  SizedBox(
                    height: dimension.height60,
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 400),
                    onPressed: () {
                      print("tapped");
                      googleLocationLoad = true;
                      setState(() {});
                      _initializeLocation();
                      // Get.defaultDialog(
                      //     // ScaffoldKey.currentState?.openEndDrawer();
                      //
                      //     // backgroundColor: Colors.transparent,
                      //   title: "",
                      //     content: Container(
                      //       height: 150,
                      //         width: 150,
                      //         // color: Colors.transparent,
                      //         child: Lottie.asset("assets/lottie/loading.json"))
                      //     // middleText: "Are you sure to delete",
                      //     // content: Column(
                      //     //   children: [
                      //     //     Text(
                      //     //       "Are you sure you want to exit?",
                      //     //       style: GoogleFonts.ubuntu(
                      //     //           color: AppColors.Colorq,
                      //     //           fontSize: 18,
                      //     //           fontWeight: FontWeight.w500),
                      //     //     ),
                      //     //   ],
                      //     // ),
                      //
                      //     );
                    },
                    child: Container(
                      height: dimension.height50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColors.Colorq,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: dimension.height18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Fetch Live Location",
                              style: GoogleFonts.poppins(
                                  fontSize: dimension.height18,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: dimension.height25,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: dimension.height20,
                  ),
                  Text(
                    "+ Add Manual Location",
                    style: GoogleFonts.poppins(
                        fontSize: dimension.height18, color: AppColors.red),
                  ),
                  SizedBox(
                    height: dimension.height10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.themColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(7)),
                    child: TextFormField(
                      controller: _addressController,
                      maxLines: 2,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.Colorq,
                      ),
                      // controller: passwordController,
                      keyboardType: TextInputType.text,
                      // obscureText: spwd,
                      // obscureText: true,

                      decoration: InputDecoration(
                        hintText: "Flat no./ Residency/ Street/ Area/ City....",
                        hintStyle: GoogleFonts.poppins(
                            fontSize: dimension.height16,
                            color: AppColors.Colorq.withOpacity(0.5)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(color: AppColors.themColor),
                        contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.themColor),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                      onChanged: (value) {
                        currentLocation = _addressController.text.toString();

                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Address';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 400),
                    onPressed: () {
                      print("tapped");
                      // _initializeLocation();
                      if (currentLocation == "") {
                        Get.snackbar("Enter required field", "Enter address",
                            colorText: Colors.white);
                      } else {
                        print("${_currentAddress}");
                        Get.offAll(
                          () => NavigationBarr(),
                        );
                      }
                    },
                    child: Container(
                      height: dimension.height50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColors.Colorq,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+ Add",
                              style: GoogleFonts.poppins(
                                  fontSize: dimension.height18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: googleLocationLoad == true
                    ? CircularProgressIndicator(
                        color: AppColors.Colorq,
                      )
                    : SizedBox())
          ],
        )),
      ),
    );
  }
}
