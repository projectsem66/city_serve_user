import 'package:city_serve/src/authentication/otp_page.dart';
import 'package:city_serve/src/page/bookingPages/bookingSubPage.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../btm_controller.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

String bookingId = "";
BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;
List<Map<String, dynamic>> providersList = [];


class _BookingsState extends State<Bookings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getProvidersWithUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex1 = 0;
                _.currentIndex = 0;
                _.update();
                print(_currentIndex1);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Text(data["lastName"].toString()),
              Container(
                height: screenheight() - dimension.height100 * 1.5,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('bookingg')
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];

                          return documentSnapshot.get("userId") ==
                              auth.currentUser?.uid
                              ? Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.to(BookingSubPage());
                              bookingId = documentSnapshot.id;
                              print(bookingId);
                            },
                            child: Animate(
                              effects: [ShimmerEffect()],
                              child: Padding(
                                padding:
                                EdgeInsets.only(top: dimension.height7),
                                child: Container(
                                  // height: 200,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      border: Border.all(
                                          color: AppColors.Colorq,
                                          width: 1)),
                                  child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                      Row(
                                      children: [
                                      Expanded(
                                      flex:2,
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    documentSnapshot.get(
                                                        " serviceImg")),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                            BorderRadius.circular(
                                                7),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 5,
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                          Container(
                                          decoration: BoxDecoration(
                                          color:  documentSnapshot
                                              .get("status") ==
                                              "Pending"
                                              ? AppColors.red.withOpacity(0.2)
                                              : documentSnapshot.get(
                                              "status") ==
                                              "Cancelled"
                                              ? AppColors.grey.withOpacity(0.2)
                                              : documentSnapshot.get(
                                              "status") ==
                                              "Accepted"
                                              ? AppColors
                                              .lightGreen.withOpacity(0.2)
                                              : documentSnapshot
                                              .get(
                                              "status") ==
                                              "In Progress"
                                              ? AppColors
                                              .jetBlue.withOpacity(0.2)
                                              : documentSnapshot.get("status") ==
                                              "is Done?"
                                              ? Colors
                                              .orange.withOpacity(0.2)
                                              : documentSnapshot.get("status") ==
                                              "Completed"
                                              ? AppColors
                                              .darkGreen.withOpacity(0.2)
                                              : documentSnapshot.get("status") == "Rated"
                                              ? AppColors.yellow.withOpacity(0.2)
                                              : AppColors.Colorq.withOpacity(0.2),
                                          borderRadius:
                                          BorderRadius
                                          .circular(
                                          7),
                                      border: Border.all(
                                          color:
                                          documentSnapshot
                                              .get("status") ==
                                              "Pending"
                                              ? AppColors.red
                                              : documentSnapshot.get(
                                              "status") ==
                                              "Cancelled"
                                              ? AppColors.grey
                                              : documentSnapshot.get(
                                              "status") ==
                                              "Accepted"
                                              ? AppColors
                                              .lightGreen
                                              : documentSnapshot
                                              .get(
                                              "status") ==
                                              "In Progress"
                                              ? AppColors
                                              .jetBlue
                                              : documentSnapshot.get("status") ==
                                              "is Done?"
                                              ? Colors
                                              .orange
                                              : documentSnapshot.get("status") ==
                                              "Completed"
                                              ? AppColors
                                              .darkGreen
                                              : documentSnapshot.get("status") == "Rated"
                                              ? AppColors.yellow
                                              : AppColors.Colorq,


                                      ),
                                          ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets
                                        .symmetric(
                                        horizontal:
                                        5,
                                        vertical:
                                        4),
                                    child: Text(
                                      documentSnapshot
                                          .get(
                                          "status"),
                                      style: GoogleFonts
                                          .poppins(
                                          color:
                                          documentSnapshot
                                              .get("status") ==
                                              "Pending"
                                              ? AppColors.red
                                              : documentSnapshot.get(
                                              "status") ==
                                              "Cancelled"
                                              ? AppColors.grey
                                              : documentSnapshot.get(
                                              "status") ==
                                              "Accepted"
                                              ? AppColors
                                              .lightGreen
                                              : documentSnapshot
                                              .get(
                                              "status") ==
                                              "In Progress"
                                              ? AppColors
                                              .jetBlue
                                              : documentSnapshot.get("status") ==
                                              "is Done?"
                                              ? Colors
                                              .orange
                                              : documentSnapshot.get("status") ==
                                              "Completed"
                                              ? AppColors
                                              .darkGreen
                                              : documentSnapshot.get("status") == "Rated"
                                              ? AppColors.yellow
                                              : AppColors.Colorq,
                                          fontSize:
                                          dimension
                                              .height14,
                                          fontWeight:
                                          FontWeight
                                              .w600),
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                documentSnapshot.get(
                                    " serviceName"),
                                overflow: TextOverflow.ellipsis,
                                style:
                                GoogleFonts.poppins(
                                    color: AppColors
                                        .Colorq,
                                    fontSize:
                                    dimension
                                        .height18,
                                    fontWeight:
                                    FontWeight
                                        .w500),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ],
                          )
                          ,
                          )
                          ],
                          ),
                          SizedBox(
                          height: 15,
                          ),
                          Container(
                          decoration: BoxDecoration(
                          color: AppColors.Colorq
                                .withOpacity(0.05),
                          borderRadius:
                          BorderRadius.circular(7),
                          ),
                          child: Padding(
                          padding:
                          const EdgeInsets.all(8.0),
                          child: Column(
                          children: [
                          Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                                .spaceBetween,
                          children: [
                          Text(
                          "Service Charge",
                          style: GoogleFonts.poppins(
                          color: AppColors
                                .Colorq,
                          fontSize:
                          dimension
                                .height14,
                          fontWeight:
                          FontWeight
                                .w500),
                          ),
                          Text(
                          "₹${documentSnapshot.get(
                          "totalPrice")}",
                          style: GoogleFonts.poppins(
                          color: AppColors
                                .Colorq,
                          fontSize:
                          dimension
                                .height14,
                          fontWeight:
                          FontWeight
                                .w500),
                          ),
                          ],
                          ),
                          Divider(thickness: 1),
                          Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                                .spaceBetween,
                          children: [
                          Text(
                          "Date & Time",
                          style: GoogleFonts.poppins(
                          color: AppColors
                                .Colorq,
                          fontSize:
                          dimension
                                .height14,
                          fontWeight:
                          FontWeight
                                .w500),
                          ),
                          Text(
                          "${documentSnapshot.get(
                          "date") + " " +
                          documentSnapshot.get(
                          "time")}",
                          style: GoogleFonts.poppins(
                          color: AppColors
                                .Colorq,
                          fontSize:
                          dimension
                                .height14,
                          fontWeight:
                          FontWeight
                                .w500),
                          ),
                          ],
                          ),
                          Divider(thickness: 1),
                          Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                                .spaceBetween,
                          children: [
                          Text(
                          "Provider",
                          style: GoogleFonts.poppins(
                          color: AppColors
                                .Colorq,
                          fontSize:
                          dimension
                                .height14,
                          fontWeight:
                          FontWeight
                                .w500),
                          ),
                          Text(
                          documentSnapshot.get(" providerName"),
                          // documentSnapshot1?.get("userId"),
                          style: GoogleFonts.poppins(
                          color: AppColors
                                .Colorq,
                          fontSize:
                          dimension
                                .height14,
                          fontWeight:
                          FontWeight
                                .w500),
                          ),
                          ],
                          ),
                          ],
                          ),
                          ),
                          ),
                          ],
                          ),
                          ),
                          ),
                          ),
                            ),
                          )
                              : SizedBox();
                          // documentSnapshot.get("subcategory")
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.Colorq,
                        strokeCap: StrokeCap.round,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
