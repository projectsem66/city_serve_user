import 'package:city_serve/src/page/serviceDescription.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../btm_controller.dart';
import '../../firebaseService/fbRefrences.dart';
import '../../utils/colors.dart';
import '../authentication/otp_page.dart';
import 'cartPages/summary.dart';
import 'category.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}
BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;
class _FavouritePageState extends State<FavouritePage> {

  List<String> _favoriteItems = [];

  Future<void> _getFavoriteItems() async {
    final DocumentSnapshot userDoc =
    await FirebaseFirestore.instance
        .collection('userDetails')
        .doc(auth.currentUser?.uid).get();
    setState(() {
      _favoriteItems = List<String>.from(
          (userDoc.data() as Map<String, dynamic>)['favoriteItems']);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFavoriteItems();
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
        title: Text("Favourites",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: dimension.height22,
                fontWeight: FontWeight.w400)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        return _favoriteItems.contains(documentSnapshot.id)
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
                                              height: dimension.height7,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: AppColors.yellow,
                                                  size:
                                                  dimension.height20,
                                                ),
                                                SizedBox(
                                                  width: dimension.height5,
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
                                              height: dimension.height7,
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
                                          height: 117,
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
                                                    documentSnapshot.id;
                                                    Get.to(
                                                        ServiceDescription(
                                                            serviceId:
                                                            documentSnapshot.id),
                                                        transition:
                                                        Transition.downToUp);
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
                                  SizedBox(height: dimension.height5,),
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
                                  SizedBox(height: dimension.height5,),
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
                                          decoration: TextDecoration.underline,
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
                    child: CircularProgressIndicator(
                      strokeCap: StrokeCap.round,
                      color: AppColors.Colorq,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
