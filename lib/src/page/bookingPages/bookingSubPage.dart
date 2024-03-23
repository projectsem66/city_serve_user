import 'package:city_serve/src/page/bookingPages/bookings.dart';
import 'package:city_serve/src/page/bookingPages/paymentPage.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class BookingSubPage extends StatefulWidget {
  BookingSubPage({super.key});

  @override
  State<BookingSubPage> createState() => _ServiceDescriptionState();
}

DocumentSnapshot? bookServiceRef;

class _ServiceDescriptionState extends State<BookingSubPage> {
  @override
  void initState() {
    super.initState();

    fetchBookingData();
    setState(() {

    });
  }

  callProviderNumber(String phoneNumber) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (!res!) {
      // Handle error
    }
  }

  // for get booking details
  Future<void> fetchBookingData() async {
    try {
      DocumentSnapshot snapshot = await getDocument();
      setState(() {
        bookServiceRef = snapshot;
      });
    } catch (e) {
      print('Error retrieving document: $e');
    }
  }

  Future<DocumentSnapshot> getDocument() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('bookingg').doc(bookingId);
    return documentReference.get();
  }

  double serviceRating = 0.0;

  @override
  Widget build(BuildContext context) {
    TextEditingController _reasonController = TextEditingController();
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
        title: Text("Bookings",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: dimension.height22,
                fontWeight: FontWeight.w400)),
      ),
      body: bookServiceRef != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenheight() - dimension.height100 * 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: bookServiceRef?.get("status") == "Pending"
                                  ? AppColors.red.withOpacity(0.1)
                                  : bookServiceRef?.get("status") == "Cancelled"
                                      ? AppColors.red.withOpacity(0.1)
                                      : bookServiceRef?.get("status") ==
                                              "Accepted"
                                          ? AppColors.lightGreen
                                              .withOpacity(0.1)
                                          : bookServiceRef?.get("status") ==
                                                  "In Progress"
                                              ? AppColors.jetBlue
                                                  .withOpacity(0.1)
                                              : bookServiceRef?.get("status") ==
                                                      "is Done?"
                                                  ? AppColors.yellow
                                                      .withOpacity(0.1)
                                                  : bookServiceRef
                                                              ?.get("status") ==
                                                          "Completed"
                                                      ? AppColors.darkGreen
                                                          .withOpacity(0.1)
                                                      : AppColors.Colorq
                                                          .withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bookServiceRef!.get("status").toString(),
                                    // Completed == null
                                    //  Accepted == null
                                    //  Cancelled == Reason of booking cancel
                                    style: GoogleFonts.poppins(
                                        color: bookServiceRef?.get("status") ==
                                                "Pending"
                                            ? AppColors.red
                                            : bookServiceRef?.get("status") ==
                                                    "Cancelled"
                                                ? AppColors.red
                                                : bookServiceRef
                                                            ?.get("status") ==
                                                        "Accepted"
                                                    ? AppColors.lightGreen
                                                    : bookServiceRef?.get(
                                                                "status") ==
                                                            "In Progress"
                                                        ? AppColors.jetBlue
                                                        : bookServiceRef?.get(
                                                                    "status") ==
                                                                "is Done?"
                                                            ? AppColors.yellow
                                                            : bookServiceRef?.get(
                                                                        "status") ==
                                                                    "Completed"
                                                                ? AppColors
                                                                    .darkGreen
                                                                : AppColors
                                                                    .Colorq,
                                        fontSize: dimension.height14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  bookServiceRef!.get("status") == "Cancelled"
                                      ? Text(
                                          bookServiceRef!
                                              .get("cancelReason")
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          // Completed == null
                                          //  Accepted == null
                                          //  Cancelled == Reason of booking cancel
                                          style: GoogleFonts.poppins(
                                              color: bookServiceRef?.get(
                                                          "status") ==
                                                      "Pending"
                                                  ? AppColors.red
                                                  : bookServiceRef
                                                              ?.get("status") ==
                                                          "Cancelled"
                                                      ? AppColors.red
                                                      : bookServiceRef?.get(
                                                                  "status") ==
                                                              "Accepted"
                                                          ? AppColors.lightGreen
                                                          : bookServiceRef?.get(
                                                                      "status") ==
                                                                  "In Progress"
                                                              ? AppColors
                                                                  .jetBlue
                                                              : bookServiceRef
                                                                          ?.get(
                                                                              "status") ==
                                                                      "is Done?"
                                                                  ? AppColors
                                                                      .yellow
                                                                  : bookServiceRef?.get(
                                                                              "status") ==
                                                                          "Completed"
                                                                      ? AppColors
                                                                          .darkGreen
                                                                      : AppColors
                                                                          .Colorq,
                                              fontSize: dimension.height14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      : SizedBox()
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: dimension.height20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Booking ID",
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: dimension.height15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                bookingId,
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: dimension.height15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            height: dimension.height30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bookServiceRef?.get(" serviceName"),
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.height18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: dimension.height5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Date : ",
                                          style: GoogleFonts.poppins(
                                              color:
                                                  AppColors.Colorq.withOpacity(
                                                      0.8),
                                              fontSize: dimension.height16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          bookServiceRef?.get("date"),
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontSize: dimension.height16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Time : ",
                                          style: GoogleFonts.poppins(
                                              color:
                                                  AppColors.Colorq.withOpacity(
                                                      0.8),
                                              fontSize: dimension.height16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          bookServiceRef?.get("time"),
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontSize: dimension.height16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            bookServiceRef?.get(" serviceImg")),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            height: dimension.height30,
                          ),
                          Text(
                            "Booking Description",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            bookServiceRef?.get("bookingDescription"),
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq.withOpacity(0.8),
                                fontSize: dimension.height16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: dimension.height20,
                          ),
                          Text(
                            "About Provider",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: dimension.height10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(dimension.height7),
                              color: AppColors.Colorq.withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: dimension.height70,
                                        width: dimension.height70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(bookServiceRef
                                                ?.get("providerImg")),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: dimension.height15,
                                      ),
                                      Container(
                                        width: dimension.height100 * 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              bookServiceRef
                                                  ?.get(" providerName"),
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontSize: dimension.height18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              bookServiceRef
                                                  ?.get("providerMoNo"),
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontSize: dimension.height18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Bounce(
                                        onPressed: () {
                                          callProviderNumber(bookServiceRef
                                              ?.get("providerMoNo"));
                                        },
                                        duration: Duration(milliseconds: 200),
                                        child: Container(
                                          height: dimension.height40,
                                          width: dimension.height40,
                                          decoration: BoxDecoration(
                                              color:
                                                  AppColors.Colorq.withOpacity(
                                                      0.3),
                                              shape: BoxShape.circle),
                                          child: Icon(Icons.call),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: dimension.height10,
                          ),
                        ],
                      ),
                    ),
                    // Bounce(
                    //   duration: Duration(milliseconds: 200),
                    //   onPressed: () {
                    //     documentSnapshot?.get("status") == "Pending" ||
                    //             documentSnapshot?.get("status") == "Accepted"
                    //         ? Get.defaultDialog(
                    //             // ScaffoldKey.currentState?.openEndDrawer();
                    //             buttonColor: AppColors.Colorq,
                    //             backgroundColor: Colors.white,
                    //             cancelTextColor: AppColors.Colorq,
                    //             titleStyle: GoogleFonts.amaranth(
                    //                 fontSize: dimension.height18,
                    //                 color: AppColors.Colorq),
                    //             titlePadding: EdgeInsets.all(10),
                    //             title:
                    //                 "Please give reason for cancelling this booking?",
                    //             contentPadding: EdgeInsets.all(20),
                    //             // middleText: "Are you sure to delete",
                    //             content: Column(
                    //               children: [
                    //                 Container(
                    //                   // height: dimension.height30,
                    //                   decoration: BoxDecoration(
                    //                       color: AppColors.Colorq.withOpacity(
                    //                           0.05),
                    //                       borderRadius:
                    //                           BorderRadius.circular(7)),
                    //                   child: TextFormField(
                    //                     maxLines: null,
                    //                     controller: _reasonController,
                    //                     // Set to null for unlimited lines or specify a number for a maximum number of lines
                    //                     keyboardType: TextInputType.multiline,
                    //                     textInputAction:
                    //                         TextInputAction.newline,
                    //                     cursorColor: Colors.black,
                    //                     style: TextStyle(
                    //                       fontSize: 18,
                    //                       color: Colors.black,
                    //                     ),
                    //                     onChanged: (value) {
                    //                       setState(() {});
                    //                     },
                    //                     decoration: InputDecoration(
                    //                       floatingLabelBehavior:
                    //                           FloatingLabelBehavior.always,
                    //                       labelText: "Enter reason here",
                    //                       labelStyle: GoogleFonts.poppins(
                    //                           color: AppColors.Colorq,
                    //                           fontSize: 17,
                    //                           fontWeight: FontWeight.w300),
                    //                       contentPadding:
                    //                           EdgeInsets.fromLTRB(5, 10, 5, 0),
                    //                       focusedBorder: OutlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                             color: AppColors.Colorq),
                    //                         borderRadius:
                    //                             BorderRadius.circular(5.0),
                    //                       ),
                    //                       enabledBorder: OutlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                             color: Colors.transparent),
                    //                         borderRadius:
                    //                             BorderRadius.circular(5.0),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             textConfirm: "Submit",
                    //             confirm: TextButton(
                    //               onPressed: () async {
                    //                 FirebaseFirestore.instance
                    //                     .collection('bookingg')
                    //                     .doc(bookingId)
                    //                     .update({
                    //                   "cancelReason":
                    //                       _reasonController.text.toString()
                    //                 });
                    //                 FirebaseFirestore.instance
                    //                     .collection('bookingg')
                    //                     .doc(bookingId)
                    //                     .update({"status": "Cancelled"});
                    //                 setState(() {});
                    //                 Get.back();
                    //                 Get.back();
                    //                 // Get.to(PaymentPage());
                    //               },
                    //               child: Container(
                    //                 height: dimension.height35,
                    //                 width: dimension.width85,
                    //                 decoration: BoxDecoration(
                    //                     color:
                    //                         AppColors.Colorq.withOpacity(0.3),
                    //                     border: Border.all(
                    //                         color: AppColors.Colorq, width: 2),
                    //                     borderRadius:
                    //                         BorderRadius.circular(10)),
                    //                 child: Center(
                    //                   child: Text(
                    //                     "Submit",
                    //                     style: GoogleFonts.poppins(
                    //                       color: AppColors.Colorq,
                    //                       fontSize: dimension.height18,
                    //                       fontWeight: FontWeight.w500,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           )
                    //         : documentSnapshot?.get("status") == "Cancelled"
                    //             ? ""
                    //             : documentSnapshot?.get("status") == "Completed"
                    //                 ? Get.to(PaymentPage())
                    //                 : documentSnapshot?.get("status") ==
                    //                         "In progress"
                    //                     ? ""
                    //                     : "";
                    //     // Get.to(Summary(), transition: Transition.cupertino);
                    //   },
                    //   child: Container(
                    //     width: double.maxFinite,
                    //     decoration: BoxDecoration(
                    //         color: AppColors.Colorq,
                    //         borderRadius: BorderRadius.circular(7)),
                    //     child: Padding(
                    //       padding:
                    //           EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    //       child: Center(
                    //         child: Text(
                    //           documentSnapshot?.get("status") == "Pending" ||
                    //                   documentSnapshot?.get("status") ==
                    //                       "Accepted"
                    //               ? "Cancel Booking"
                    //               : documentSnapshot?.get("status") ==
                    //                       "Cancelled"
                    //                   ? "Order is cancelled"
                    //                   : documentSnapshot?.get("status") ==
                    //                           "Completed"
                    //                       ? "Pay Now"
                    //                       : documentSnapshot?.get("status") ==
                    //                               "In progress"
                    //                           ? ""
                    //                           : "", //==Pending
                    //           // Completed == pay now
                    //           //  Accepted == cancel booking
                    //           //  Cancelled == null
                    //           style: GoogleFonts.poppins(
                    //             color: Colors.white,
                    //             fontSize: dimension.height18,
                    //             fontWeight: FontWeight.w400,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    if (bookServiceRef?.get("status") == "Pending" ||
                        bookServiceRef?.get("status") == "Accepted")
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {
                          Get.defaultDialog(
                            // ScaffoldKey.currentState?.openEndDrawer();
                            buttonColor: AppColors.Colorq,
                            backgroundColor: Colors.white,
                            cancelTextColor: AppColors.Colorq,
                            titleStyle: GoogleFonts.amaranth(
                                fontSize: dimension.height18,
                                color: AppColors.Colorq),
                            titlePadding: EdgeInsets.all(10),
                            title:
                                "Please give reason for cancelling this booking?",
                            contentPadding: EdgeInsets.all(20),
                            // middleText: "Are you sure to delete",
                            content: Column(
                              children: [
                                Container(
                                  // height: dimension.height30,
                                  decoration: BoxDecoration(
                                      color: AppColors.Colorq.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: TextFormField(
                                    maxLines: null,
                                    controller: _reasonController,
                                    // Set to null for unlimited lines or specify a number for a maximum number of lines
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.newline,
                                    cursorColor: Colors.black,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: "Enter reason here",
                                      labelStyle: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(5, 10, 5, 0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: AppColors.Colorq),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            textConfirm: "Submit",
                            confirm: TextButton(
                              onPressed: () async {
                                FirebaseFirestore.instance
                                    .collection('bookingg')
                                    .doc(bookingId)
                                    .update({
                                  "cancelReason":
                                      _reasonController.text.toString()
                                });
                                FirebaseFirestore.instance
                                    .collection('bookingg')
                                    .doc(bookingId)
                                    .update({"status": "Cancelled"});
                                setState(() {});
                                Get.back();
                                Get.back();
                                // Get.to(PaymentPage());
                              },
                              child: Container(
                                height: dimension.height35,
                                width: dimension.width85,
                                decoration: BoxDecoration(
                                    color: AppColors.Colorq.withOpacity(0.3),
                                    border: Border.all(
                                        color: AppColors.Colorq, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Submit",
                                    style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.height18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq,
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 7),
                            child: Center(
                              child: Text(
                                "Cancel booking",
                                //==Pending
                                // Completed == pay now
                                //  Accepted == cancel booking
                                //  Cancelled == null
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: dimension.height18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (bookServiceRef?.get("status") == "Cancelled")
                      SizedBox(),
                    if (bookServiceRef?.get("status") == "In Progress")
                      Center(
                          child: Text(
                        "Service in progress",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height14,
                            fontWeight: FontWeight.w500),
                      )),
                    if (bookServiceRef?.get("status") == "is Done?")
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Service is Done?"),
                          Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('bookingg')
                                  .doc(bookingId)
                                  .update({"status": "Completed"});
                              fetchBookingData();
                              setState(() {});
                            },
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  color: AppColors.Colorq,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 7),
                                child: Center(
                                  child: Text(
                                    "Done",
                                    //==Pending
                                    // Completed == pay now
                                    //  Accepted == cancel booking
                                    //  Cancelled == null
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: dimension.height16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (bookServiceRef?.get("status") == "Completed")
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {
                          Get.to(PaymentPage());
                        },
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq,
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 7),
                            child: Center(
                              child: Text(
                                "Pay Now",
                                //==Pending
                                // Completed == pay now
                                //  Accepted == cancel booking
                                //  Cancelled == null
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: dimension.height18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (bookServiceRef?.get("status") == "Paid")
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {
                          Get.defaultDialog(
                            // ScaffoldKey.currentState?.openEndDrawer();
                            buttonColor: AppColors.Colorq,
                            backgroundColor: Colors.white,
                            cancelTextColor: AppColors.Colorq,
                            titleStyle: GoogleFonts.poppins(
                                fontSize: dimension.height18,
                                color: AppColors.Colorq),
                            titlePadding: EdgeInsets.all(10),
                            title: "Rate now",

                            contentPadding: EdgeInsets.all(20),
                            // middleText: "Are you sure to delete",
                            content: Column(
                              children: [
                                Container(
                                  height: 50,
                                  child: RatingBar.builder(
                                    initialRating: 0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      serviceRating = rating;
                                      setState(() {});

                                      print(serviceRating);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            textConfirm: "Submit",
                            confirm: TextButton(
                              onPressed: () async {
                                FirebaseFirestore.instance
                                    .collection('providerServiceDetails')
                                    .doc(bookServiceRef
                                        ?.get("productServiceDetailsId"))
                                    .update({
                                  "serviceRating":
                                      FieldValue.increment(serviceRating),
                                  "ratingUsers": FieldValue.increment(1)
                                });
                                FirebaseFirestore.instance
                                    .collection('bookingg')
                                    .doc(bookingId)
                                    .update({"status": "Rated"});
                                fetchBookingData();
                                setState(() {});
                                // Get.back();
                                Get.back();
                                // Get.to(PaymentPage());
                              },
                              child: Container(
                                height: dimension.height35,
                                width: dimension.width85,
                                decoration: BoxDecoration(
                                    color: AppColors.Colorq.withOpacity(0.3),
                                    border: Border.all(
                                        color: AppColors.Colorq, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Submit",
                                    style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.height18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq,
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 7),
                            child: Center(
                              child: Text(
                                "Rate Now",
                                //==Pending
                                // Completed == pay now
                                //  Accepted == cancel booking
                                //  Cancelled == null
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: dimension.height18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
// Center(
// child: documentSnapshot != null
// ? Text(documentSnapshot!.get("images"))
//     : CircularProgressIndicator(), // Show a loading indicator while fetching data
// ),
