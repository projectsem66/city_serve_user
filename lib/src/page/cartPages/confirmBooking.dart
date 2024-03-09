import 'dart:developer';

import 'package:city_serve/src/page/cartPages/addressAndSlot.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../location/googleLocation.dart';
import '../serviceDescription.dart';

class ConfirmBooking extends StatefulWidget {
  const ConfirmBooking({super.key});

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  addcategory(String bookServiceId) async {
    if (bookServiceId == null) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter Required Field"),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Ok")),
            ],
          );
        },
      );
    } else {
      uploadData();
    }
  }

  uploadData() async {
    FirebaseFirestore.instance.collection("bookingg").add({
      "address": currentLocation,
      "date": DateFormat('dd-MM-yyyy').format(selectedDate!),
      "productServiceDetailsId": bookServiceId,
      "providerId": ServiceProviderId,
      "status": "pending",
      "userId":"123456",
      "time": selectedTime!.format(context)
    }).then((value) {
      log("User Uploaded");
    });
    // await _collectionReference
    //     .doc(_cname.toString())
    //     .set({"cname": _cname.text.toString(), "cimage": url}).then(
    //   (value) {
    //     print("data Added");
    //   },
    // );
  }

  // showAlertBox() {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("Pick Image From"),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ListTile(
  //               onTap: () {
  //                 pickImage(ImageSource.camera);
  //                 Get.back();
  //               },
  //               leading: Icon(Icons.camera_alt),
  //               title: Text("Camera"),
  //             ),
  //             ListTile(
  //               onTap: () {
  //                 pickImage(ImageSource.gallery);
  //                 Get.back();
  //               },
  //               leading: Icon(Icons.image),
  //               title: Text("Gallery"),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Get.back();
              });
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Confirm Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("spid${ServiceProviderId}"),
            Text(
              "Ac & Appliance Repair",
              style: GoogleFonts.poppins(
                  color: AppColors.Colorq,
                  fontSize: dimension.height18,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text(
                  "Price :",
                  style: GoogleFonts.poppins(
                      color: AppColors.Colorq,
                      fontSize: dimension.height18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: dimension.height7,
                ),
                Text(
                  "₹200",
                  style: GoogleFonts.poppins(
                      color: AppColors.Colorq,
                      fontSize: dimension.height18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Container(
              // color: Colors.yellowAccent,
              height: screenheight() - dimension.height100 * 2.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.Colorq),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                              child: Icon(
                            Icons.percent,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: dimension.height10,
                      ),
                      Text(
                        "Coupons and Offers",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {
                          Get.bottomSheet(
                            isDismissible: true,
                            Container(
                              height: 285,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                            ),
                          );
                        },
                        child: Text(
                          "Offers >",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimension.height30,
                  ),
                  Text(
                    "Payment Summary",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height18,
                        fontWeight: FontWeight.w600),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Item total",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "₹700",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Coupon discount",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "₹70",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "₹770",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: dimension.height30),
                  Text(
                    "Cancellation & Reschedule  Policy",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: dimension.height5,
                  ),
                  Text(
                    "Free cancellation if done more than 3 hrs before the service or if professional not provided",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height16,
                        fontWeight: FontWeight.w400),
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 200),
                    onPressed: () {
                      Get.bottomSheet(
                          isDismissible: true,
                          Container(
                            height: dimension.height100 * 2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 10, left: 10),
                              child: Text(
                                "You will be charged a cancellation fee if you cancel or reschedule your appointment without giving a minimum of 3 hrs notice prior to the start of the appointment. The cancellation fee will be up to 100 rs of the amount. Thank you! ",
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: dimension.height16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ));
                    },
                    child: Text(
                      "Learn more",
                      style: GoogleFonts.poppins(
                          decoration: TextDecoration.underline,
                          color: AppColors.Colorq,
                          fontSize: dimension.height16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: AppColors.Colorq,
                      size: dimension.height26,
                    ),
                    SizedBox(
                      width: dimension.height10,
                    ),
                    Container(
                      width: screenwidth() - dimension.width55,
                      child: Text(
                        '${currentLocation}',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_sharp,
                      color: AppColors.Colorq,
                      size: dimension.height26,
                    ),
                    SizedBox(
                      width: dimension.height10,
                    ),
                    Text(
                      '${DateFormat('dd-MM-yyyy').format(selectedDate!)} - ',
                      style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${selectedTime!.format(context)}',
                      style: GoogleFonts.poppins(
                          color: AppColors.Colorq,
                          fontSize: dimension.height16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: dimension.height10,
                ),
                Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    // Get.to(AddressAndSlot(), transition: Transition.cupertino);
                    addcategory(bookServiceId);
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.Colorq,
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                      child: Center(
                        child: Text(
                          "Confirm Booking",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
