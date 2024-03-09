import 'package:city_serve/src/page/bookings.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class BookingSubPage extends StatefulWidget {
  BookingSubPage({super.key});

  @override
  State<BookingSubPage> createState() => _ServiceDescriptionState();
}

String bookServiceId = "";
String ServiceProviderId = "";

class _ServiceDescriptionState extends State<BookingSubPage> {
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
        title: Text("Bookings"),
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
                              fontSize: dimension.height17,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          bookingId,
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height17,
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
                              "Service name",
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
                                  "February 29,2024",
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
                                  "07.30 AM",
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
                                image: AssetImage(
                                    "assets/dashboard/mostBook/1u.jpg")),
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
                                        "Felix Harris",
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.height18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "6262626262",
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
              Bounce(
                duration: Duration(milliseconds: 200),
                onPressed: () {
                  // Get.to(Summary(), transition: Transition.cupertino);
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
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    textConfirm: "Submit",
                    confirm: TextButton(
                      onPressed: () async {
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
                                fontWeight: FontWeight.w500),
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
                    padding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    child: Center(
                      child: Text(
                        "Cancel Booking", //==Pending
                        // Completed == pay now
                        //  Accepted == cancel booking
                        //  Cancelled == null
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
