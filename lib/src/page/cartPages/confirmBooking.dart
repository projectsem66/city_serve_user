import 'dart:developer';

import 'package:city_serve/navigationBar.dart';
import 'package:city_serve/src/authentication/otp_page.dart';
import 'package:city_serve/src/page/cartPages/addressAndSlot.dart';
import 'package:city_serve/src/page/cartPages/summary.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../btm_controller.dart';
import '../../../utils/colors.dart';
import '../serviceDescription.dart';

class ConfirmBooking extends StatefulWidget {
  const ConfirmBooking({super.key});

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

BtmController _ = Get.put(BtmController());

int _currentIndex1 = 0;
int _currentIndex = 0;

class _ConfirmBookingState extends State<ConfirmBooking> {
  addBooking(String bookServiceId) async {
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
      "address": bookingAddress,
      "date": DateFormat('dd-MM-yyyy').format(selectedDate!),
      "productServiceDetailsId": bookServiceId,
      "providerId": ServiceProviderId,
      "status": "Pending",
      "userId": auth.currentUser?.uid.toString(),
      "time": selectedTime!.format(context),
      " serviceImg": serviceImg,
      " serviceName": serviceName,
      " serviceDuration": serviceDuration,
      " providerName": providerName,
      " servicePrice": servicePrice,
      "providerMoNo": providerMoNo,
      "providerImg":providerImg,
      "totalPrice":(itemPrice - itemPrice*0.1).toDouble(),
      "bookingDescription":bookingDescription,
    }).then((value) {
      log("Booking Uploaded");
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
        title: Text("Confirm Booking",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: dimension.height22,
                fontWeight: FontWeight.w400)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
                    "₹$itemPrice",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                // color: Colors.yellowAccent,
                height: screenheight() - dimension.height100 * 2.66,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

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
                          "₹${itemPrice}",
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
                          "Discount",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "₹${(itemPrice*0.1).toStringAsFixed(2)}",
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
                          "₹${(itemPrice -itemPrice*0.1).toString()}",
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
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.home,
                          color: AppColors.Colorq,
                          size: dimension.height26,
                        ),
                      ),
                      SizedBox(
                        width: dimension.height10,
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          child: Text(
                            '${bookingAddress}',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: dimension.height5,),
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
                      addBooking(bookServiceId);
                      // Get.to(AddressAndSlot(), transition: Transition.cupertino);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Service Booked',
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.height18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Lottie.asset("assets/lottie/Done.json"),
                              ],
                            ),
                          );
                        },
                      );
                      Future.delayed(Duration(seconds: 3), () {
                        Get.to(NavigationBarr());
                        setState(() {
                          _currentIndex1 = 1;
                          _.currentIndex = 1;
                          _.update();
                          print(_currentIndex1);
                        });
                      });


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
      ),
    );
  }
}
