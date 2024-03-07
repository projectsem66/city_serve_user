import 'package:city_serve/src/page/serviceDescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/colors.dart';
import '../../utils/dimension.dart';

String SCname = "";
String Cname = "";

class ServicesPage extends StatefulWidget {
  ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text(
          "List",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Text(widget.Cname),
            // Text(widget.SCname),
            Container(
              height: screenheight() -dimension.height100,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('providerServiceDetails')
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return documentSnapshot["subcategory"] == SCname
                            ? Bounce(
                                duration: Duration(milliseconds: 200),
                                onPressed: () {
                                  documentSnapshot.id;
                                  Get.to(ServiceDescription(serviceId: documentSnapshot.id));
                                },
                                child: Padding(
                                  padding:  EdgeInsets.only(bottom: dimension.height7),
                                  child: Container(
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.Colorq, width: 2),
                                        borderRadius: BorderRadius.circular(
                                            dimension.height7)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    documentSnapshot
                                                        .get("serviceName"),
                                                    style: GoogleFonts.poppins(
                                                        color: AppColors.Colorq,
                                                        fontSize:
                                                            dimension.height20,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: dimension.height5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: AppColors.Colorq,
                                                        size: dimension.height20,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "4.2",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize:
                                                                    dimension
                                                                        .height17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: dimension.height5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "₹${documentSnapshot.get("servicePrice")}",
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                                horizontal:
                                                                    dimension
                                                                        .height10),
                                                        child: Icon(Icons.circle,
                                                            size: 10,
                                                            color:
                                                                AppColors.Colorq),
                                                      ),
                                                      Text(
                                                        "2 hrs",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize:
                                                                    dimension
                                                                        .height18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 120,
                                                width: 100,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  documentSnapshot
                                                                      .get(
                                                                          "images")),
                                                              fit: BoxFit.cover),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .Colorq,
                                                              width: 2),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  dimension
                                                                      .height7)),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .bottomCenter,
                                                      child: Container(
                                                        height: 34,
                                                        width: 65,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                AppColors.Colorq,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    dimension
                                                                        .height7)),
                                                        child: Center(
                                                          child: Text(
                                                            "+ Add",
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: GoogleFonts.poppins(
                                                                color:
                                                                    Colors.white,
                                                                fontSize:
                                                                    dimension
                                                                        .height16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: dimension.height50,
                                            child: Text(
                                              "● ${documentSnapshot.get("serviceDescription")}",
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontSize: dimension.height16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Text(
                                            "View details",
                                            style: GoogleFonts.poppins(
                                                color: AppColors.red,
                                                fontSize: dimension.height16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            // documentSnapshot.get("subcategory")
                            : SizedBox();
                      },
                    );
                  }
                  return Center(
                    child: Container(
                        width: 200,
                        child: Lottie.asset(
                            "assets/lottie/cityServeLoading.json")),
                  );
                },
              ),
            ),

            // Text(widget.name)
          ],
        ),
      ),
    );
  }
}
