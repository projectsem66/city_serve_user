import 'package:city_serve/firebaseService/fbRefrences.dart';
import 'package:city_serve/src/page/cartPages/summary.dart';
import 'package:city_serve/src/page/category.dart';
import 'package:city_serve/src/page/serviceDescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/colors.dart';
import '../../utils/dimension.dart';

String Cname = "";

class ServicesPage extends StatefulWidget {
  ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  // for get provider details using provider id
  Future<void> getProviderDetails() async {
    try {
      DocumentSnapshot snapshot = await getProvider();
      setState(() {
        documentSnapshot1 = snapshot;
      });
    } catch (e) {
      print('Error retrieving document: $e');
      // Handle error appropriately
    }
  }

  Future<DocumentSnapshot> getProvider() async {
    DocumentReference documentReference =
        refProvider.doc(serviceDetailsSS!.get("providerId"));
    return documentReference.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text(
          "Services",
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
            Expanded(
              child: StreamBuilder(
                stream: refServices.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        num serviceRating =
                            documentSnapshot.get("serviceRating");
                        num ratingUsers = documentSnapshot.get("ratingUsers");
                        double result = serviceRating / ratingUsers;
                        print(result);
                        return documentSnapshot["section"] == sectionName
                            ? Padding(
                                padding:
                                    EdgeInsets.only(bottom: dimension.height7),
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
                                            Expanded(
                                              flex: 5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    documentSnapshot
                                                        .get("serviceName"),
                                                    maxLines: 2,
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
                                                        size:
                                                            dimension.height20,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '${result}(${(ratingUsers.round())})',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Colors.black54,
                                                          fontSize: dimension
                                                              .height16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: dimension.height5,
                                                  ),
                                                  Row(
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
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    dimension
                                                                        .height10),
                                                        child: Icon(
                                                            Icons.circle,
                                                            size: 10,
                                                            color: AppColors
                                                                .Colorq),
                                                      ),
                                                      Text(
                                                     documentSnapshot.get('serviceDuration') ,
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
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
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
                                                              fit:
                                                                  BoxFit.cover),
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
                                                      child: Bounce(
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        onPressed: () async {
                                                          getProviderDetails();

                                                          serviceImg =
                                                              documentSnapshot
                                                                  .get(
                                                                      "images");
                                                          serviceName =
                                                              documentSnapshot.get(
                                                                  "serviceName");
                                                          servicePrice =
                                                              documentSnapshot.get(
                                                                  "servicePrice");
                                                          serviceDuration =
                                                              documentSnapshot.get(
                                                                  "serviceDuration");
                                                          providerName =
                                                              documentSnapshot.get(
                                                                  "providerName");
                                                          ServiceProviderId =
                                                              documentSnapshot.get(
                                                                  "providerId");
                                                          providerMoNo =
                                                              documentSnapshot.get(
                                                                  "providerPhoneNumber");
                                                          itemPrice = int.parse(
                                                              servicePrice);
                                                          Get.to(SummaryPage(),
                                                              transition: Transition
                                                                  .circularReveal);
                                                        },
                                                        child: Container(
                                                          height: 34,
                                                          width: 65,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .Colorq,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          dimension
                                                                              .height7)),
                                                          child: Center(
                                                            child: Text(
                                                              "Book",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .white,
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          height: dimension.height50,
                                          child: Text(
                                            "● ${documentSnapshot.get("serviceDescription")}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontSize: dimension.height16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Bounce(
                                          duration: Duration(milliseconds: 200),
                                          onPressed: () {
                                            documentSnapshot.id;
                                            Get.to(
                                                ServiceDescription(
                                                    serviceId:
                                                        documentSnapshot.id),
                                                transition:
                                                    Transition.downToUp);
                                          },
                                          child: Text(
                                            "View details",
                                            style: GoogleFonts.poppins(
                                                color: AppColors.red,
                                                fontSize: dimension.height16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
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
                        child: CircularProgressIndicator(
                          strokeCap: StrokeCap.round,
                          color: AppColors.Colorq,
                        )),
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
