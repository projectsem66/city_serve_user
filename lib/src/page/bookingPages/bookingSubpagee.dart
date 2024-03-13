import 'package:city_serve/src/page/bookingPages/bookings.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class BookingSubPagee extends StatefulWidget {
  BookingSubPagee({super.key});

  @override
  State<BookingSubPagee> createState() => _ServiceDescriptionState();
}

String bookServiceId = "";
String ServiceProviderId = "";

class _ServiceDescriptionState extends State<BookingSubPagee> {
  DocumentSnapshot? documentSnapshot;
  DocumentSnapshot? documentSnapshot1;

  @override
  void initState() {
    super.initState();

    fetchBookingData();
  }

  // for get booking details
  Future<void> fetchBookingData() async {
    try {
      DocumentSnapshot snapshot = await getDocument();
      setState(() {
        documentSnapshot = snapshot;
      });
    } catch (e) {
      print('Error retrieving document: $e');
      // Handle error appropriately
    }
  }

  Future<DocumentSnapshot> getDocument() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('bookingg').doc(bookingId);
    return documentReference.get();
  }

  // for get service details
  Future<void> fetchServiceData() async {
    try {
      DocumentSnapshot snapshot = await getDocument2();
      setState(() {
        documentSnapshot1 = snapshot;
      });
    } catch (e) {
      print('Error retrieving document: $e');
      // Handle error appropriately
    }
  }

  Future<DocumentSnapshot> getDocument2() async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('providerServiceDetails')
        .doc(documentSnapshot?.get("documentSnapshot"));
    return documentReference.get();
  }

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
        title: Text("Bookings v"),
      ),
      body: documentSnapshot != null
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
                                color: AppColors.red.withOpacity(0.1)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                documentSnapshot!.get("status").toString(),
                                // Completed == null
                                //  Accepted == null
                                //  Cancelled == Reason of booking cancel
                                style: GoogleFonts.poppins(
                                    color: AppColors.red,
                                    fontSize: dimension.height14,
                                    fontWeight: FontWeight.w500),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    documentSnapshot?.get(" serviceName"),
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
                                            color: AppColors.Colorq.withOpacity(
                                                0.8),
                                            fontSize: dimension.height16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        documentSnapshot?.get("date"),
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
                                            color: AppColors.Colorq.withOpacity(
                                                0.8),
                                            fontSize: dimension.height16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        documentSnapshot?.get("time"),
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.height16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(documentSnapshot
                                          ?.get(" serviceImg"))),
                                  borderRadius: BorderRadius.circular(7),
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
                            "xyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz",
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
                                            shape: BoxShape.circle,
                                            color: AppColors.Colorq),
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
                                              documentSnapshot
                                                  ?.get(" providerName"),
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontSize: dimension.height18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              documentSnapshot
                                                  ?.get(" providerName"),
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontSize: dimension.height18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: dimension.height40,
                                        width: dimension.height40,
                                        decoration: BoxDecoration(
                                            color: AppColors.Colorq.withOpacity(
                                                0.3),
                                            shape: BoxShape.circle),
                                        child: Icon(Icons.call),
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
                    if (documentSnapshot?.get("status") == "Pending" ||
                        documentSnapshot?.get("status") == "Accepted")
                      Row(
                        children: [
                          Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('bookingg')
                                  .doc(bookingId)
                                  .update({"status": "Accepted"});
                              setState(() {});
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
                                    "Accept",
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
                          Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('bookingg')
                                  .doc(bookingId)
                                  .update({"status": "Cancelled"});
                              setState(() {});
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
                                    "Decline",
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
                    if (documentSnapshot?.get("status") == "Cancelled")
                      SizedBox(),
                    if (documentSnapshot?.get("status") == "In Progress")
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('bookingg')
                              .doc(bookingId)
                              .update({"status": "is Done?"});
                          setState(() {});
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
                                "End Service",
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
                    if (documentSnapshot?.get("status") == "is Done?")
                      Text("Wait for user response"),
                    if (documentSnapshot?.get("status") == "Completed")
                      Text("Payment Pending"),
                    if (documentSnapshot?.get("status") == "paid")
                      Text("Service Completed"),
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
