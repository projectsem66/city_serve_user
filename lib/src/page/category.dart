import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/colors.dart';

class Categoryy extends StatefulWidget {
  const Categoryy({super.key});

  @override
  State<Categoryy> createState() => _CategoryyState();
}

class _CategoryyState extends State<Categoryy> {
  @override
  void initState() {
    // TODO: implement initState
    getDataFromFirestore();
    super.initState();
  }

  String categoryName = "";

  final CollectionReference refC =
      FirebaseFirestore.instance.collection('category');

  // final CollectionReference refSC = FirebaseFirestore.instance
  //     .collection('category')
  //     .doc(categoryName)
  //     .collection("subcategories");
  Future<void> getDataFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('category').get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        var data = documentSnapshot.data();
        print(data);
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Category"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: screenheight() - 150,
              child: StreamBuilder(
                stream: refC.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: dimension.height8),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              categoryName =
                                  documentSnapshot['cname'].toString();

                              Get.bottomSheet(
                                  isDismissible: true,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Bounce(
                                          duration: Duration(milliseconds: 200),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.Colorq,
                                              ),
                                              child: Icon(Icons.cancel,
                                                  color: AppColors.white1,
                                                  size: 30)),
                                        ),
                                      ),
                                      Container(
                                        height: dimension.height100 * 2.99,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                documentSnapshot['cname']
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                    color: AppColors.Colorq,
                                                    fontSize:
                                                        dimension.height20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Container(
                                              height: 246,
                                              child: StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection('category')
                                                    .doc(categoryName)
                                                    .collection("subcategories")
                                                    .snapshots(),
                                                builder: (context,
                                                    AsyncSnapshot<QuerySnapshot>
                                                        streamSnapshot) {
                                                  if (streamSnapshot.hasData) {
                                                    return GridView.builder(
                                                      itemCount: streamSnapshot
                                                          .data!.docs.length,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 3,
                                                              childAspectRatio:
                                                                  0.92
                                                              // Number of columns
                                                              ),
                                                      itemBuilder:
                                                          (context, index) {
                                                        final DocumentSnapshot
                                                            documentSnapshot =
                                                            streamSnapshot.data!
                                                                .docs[index];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Bounce(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    200),
                                                            onPressed: () {
                                                              // if (index == 0) {
                                                              //   mMassage = true;
                                                              //   mSalon = false;
                                                              // }
                                                              // if (index == 1) {
                                                              //   mSalon = true;
                                                              //   mMassage = false;
                                                              // }
                                                              //
                                                              // Get.back();
                                                              // Get.to(ForMen());
                                                            },
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                    height: 70,
                                                                    width: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              dimension.height7),
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(documentSnapshot['scimage']
                                                                              .toString()),
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    )),
                                                                Container(
                                                                  height: dimension
                                                                      .height45,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    child: Text(
                                                                      documentSnapshot[
                                                                              'scname']
                                                                          .toString(),
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: GoogleFonts.poppins(
                                                                          color: AppColors
                                                                              .Colorq,
                                                                          fontSize: dimension
                                                                              .height14,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      shrinkWrap: true,
                                                    );
                                                  }

                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                },
                                              ),
                                            )
                                            // GridView.builder(
                                            //   physics:
                                            //   NeverScrollableScrollPhysics(),
                                            //   gridDelegate:
                                            //   SliverGridDelegateWithFixedCrossAxisCount(
                                            //       crossAxisCount: 3,
                                            //       childAspectRatio: 1.7),
                                            //   itemCount: 2,
                                            //   itemBuilder: (context, index) {
                                            //     return Padding(
                                            //       padding:
                                            //       const EdgeInsets.all(
                                            //           8.0),
                                            //       child: Bounce(
                                            //         duration: Duration(
                                            //             milliseconds: 200),
                                            //         onPressed: () {
                                            //           // if (index == 0) {
                                            //           //   mMassage = true;
                                            //           //   mSalon = false;
                                            //           // }
                                            //           // if (index == 1) {
                                            //           //   mSalon = true;
                                            //           //   mMassage = false;
                                            //           // }
                                            //           //
                                            //           // Get.back();
                                            //           // Get.to(ForMen());
                                            //         },
                                            //         child: Container(
                                            //           // height: 40,
                                            //           // width: 80,
                                            //           decoration: BoxDecoration(
                                            //               color: AppColors
                                            //                   .Colorq
                                            //                   .withOpacity(
                                            //                   0.5),
                                            //               borderRadius:
                                            //               BorderRadius
                                            //                   .circular(
                                            //                   7)),
                                            //         ),
                                            //       ),
                                            //     );
                                            //   },
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ));
                            },
                            child: Column(
                              children: [
                                Animate(
                                  effects: [ShimmerEffect()],
                                  child: Container(
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color:
                                            AppColors.Colorq.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(
                                            dimension.height7)),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.all(dimension.height7),
                                          height: dimension.height70,
                                          width: dimension.height70,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                dimension.height7),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                documentSnapshot['cimage'],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: dimension.height20,
                                        ),
                                        Text(
                                          documentSnapshot['cname'].toString(),
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontSize: dimension.height20,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
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
            )
          ],
        ),
      ),
    );
  }
}

// Bounce(
//   duration: Duration(milliseconds: 200),
//   onPressed: () {
//     Get.bottomSheet(
//         isDismissible: true,
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Bounce(
//                 duration: Duration(milliseconds: 200),
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColors.Colorq,
//                     ),
//                     child: Icon(Icons.cancel,
//                         color: AppColors.white1, size: 30)),
//               ),
//             ),
//             Container(
//               height: 291,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10))),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Salon for Men",
//                       style: GoogleFonts.poppins(
//                           color: AppColors.Colorq,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Container(
//                     height: 245,
//                     child: GridView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate:
//                           SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               childAspectRatio: 1.7),
//                       itemCount: 2,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Bounce(
//                             duration: Duration(milliseconds: 200),
//                             onPressed: () {
//                               if (index == 0) {
//                                 mMassage = true;
//                                 mSalon = false;
//                               }
//                               if (index == 1) {
//                                 mSalon = true;
//                                 mMassage = false;
//                               }
//
//                               Get.back();
//                               Get.to(ForMen());
//                             },
//                             child: Container(
//                               // height: 40,
//                               // width: 80,
//                               decoration: BoxDecoration(
//                                   color:
//                                       AppColors.Colorq.withOpacity(
//                                           0.5),
//                                   borderRadius:
//                                       BorderRadius.circular(7)),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ));
//   },
//   child: Column(
//     children: [
//       Container(
//         width: double.maxFinite,
//         child: Row(
//           children: [
//             Container(
//               height: dimension.height80,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image(
//                     image: AssetImage(
//                         "assets/category/category_man(rotate).jpg")),
//               ),
//             ),
//             SizedBox(
//               width: dimension.height20,
//             ),
//             Text(
//               "Salon for Men",
//               style: GoogleFonts.poppins(
//                   color: AppColors.Colorq,
//                   fontSize: dimension.height20,
//                   fontWeight: FontWeight.w400),
//             )
//           ],
//         ),
//         decoration: BoxDecoration(
//             color: AppColors.Colorq.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(7)),
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: dimension.height10,
// ),
// Bounce(
//   duration: Duration(milliseconds: 200),
//   onPressed: () {
//     Get.bottomSheet(
//         isDismissible: true,
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Bounce(
//                 duration: Duration(milliseconds: 200),
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColors.Colorq,
//                     ),
//                     child: Icon(Icons.cancel,
//                         color: AppColors.white1, size: 30)),
//               ),
//             ),
//             Container(
//               height: 291,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10))),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Salon for Women",
//                       style: GoogleFonts.poppins(
//                           color: AppColors.Colorq,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Container(
//                     height: 245,
//                     child: GridView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate:
//                           SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               childAspectRatio: 1.7),
//                       itemCount: 3,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Bounce(
//                             duration: Duration(milliseconds: 200),
//                             onPressed: () {
//                               if (index == 0) {
//                                 wSpa = true;
//                                 wSalon = false;
//                                 wStudio = false;
//                               }
//                               if (index == 1) {
//                                 wSpa = false;
//                                 wSalon = true;
//                                 wStudio = false;
//                               }
//                               if (index == 2) {
//                                 wSpa = false;
//                                 wSalon = false;
//                                 wStudio = true;
//                               }
//                               Get.back();
//                               Get.to(ForWomen());
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color:
//                                       AppColors.Colorq.withOpacity(
//                                           0.5),
//                                   borderRadius:
//                                       BorderRadius.circular(7)),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ));
//   },
//   child: Column(
//     children: [
//       Container(
//         width: double.maxFinite,
//         child: Row(
//           children: [
//             Container(
//               height: dimension.height80,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image(
//                     image: AssetImage(
//                         "assets/category/category_women.jpg")),
//               ),
//             ),
//             SizedBox(
//               width: dimension.height20,
//             ),
//             Text(
//               "Salon for Women",
//               style: GoogleFonts.poppins(
//                   color: AppColors.Colorq,
//                   fontSize: dimension.height20,
//                   fontWeight: FontWeight.w400),
//             )
//           ],
//         ),
//         decoration: BoxDecoration(
//             color: AppColors.Colorq.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(7)),
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: dimension.height10,
// ),
// Bounce(
//   duration: Duration(milliseconds: 200),
//   onPressed: () {
//     Get.bottomSheet(
//         isDismissible: true,
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Bounce(
//                 duration: Duration(milliseconds: 200),
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColors.Colorq,
//                     ),
//                     child: Icon(Icons.cancel,
//                         color: AppColors.white1, size: 30)),
//               ),
//             ),
//             Container(
//               height: 291,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10))),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Cleaning",
//                       style: GoogleFonts.poppins(
//                           color: AppColors.Colorq,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Container(
//                     height: 245,
//                     child: GridView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate:
//                           SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               childAspectRatio: 1.7),
//                       itemCount: 8,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             // height: 40,
//                             // width: 80,
//                             decoration: BoxDecoration(
//                                 color: AppColors.Colorq.withOpacity(
//                                     0.5),
//                                 borderRadius:
//                                     BorderRadius.circular(7)),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ));
//   },
//   child: Column(
//     children: [
//       Container(
//         width: double.maxFinite,
//         child: Row(
//           children: [
//             Container(
//               height: dimension.height80,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image(
//                     image: AssetImage(
//                         "assets/category/category_plumber.jpg")),
//               ),
//             ),
//             SizedBox(
//               width: dimension.height20,
//             ),
//             Text(
//               "Cleaning",
//               style: GoogleFonts.poppins(
//                   color: AppColors.Colorq,
//                   fontSize: dimension.height20,
//                   fontWeight: FontWeight.w400),
//             )
//           ],
//         ),
//         decoration: BoxDecoration(
//             color: AppColors.Colorq.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(7)),
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: dimension.height10,
// ),
// Bounce(
//   duration: Duration(milliseconds: 200),
//   onPressed: () {
//     Get.bottomSheet(
//         isDismissible: true,
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Bounce(
//                 duration: Duration(milliseconds: 200),
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColors.Colorq,
//                     ),
//                     child: Icon(Icons.cancel,
//                         color: AppColors.white1, size: 30)),
//               ),
//             ),
//             Container(
//               height: 291,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10))),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Plumber",
//                       style: GoogleFonts.poppins(
//                           color: AppColors.Colorq,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Container(
//                     height: 245,
//                     child: GridView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate:
//                           SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               childAspectRatio: 1.7),
//                       itemCount: 8,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             // height: 40,
//                             // width: 80,
//                             decoration: BoxDecoration(
//                                 color: AppColors.Colorq.withOpacity(
//                                     0.5),
//                                 borderRadius:
//                                     BorderRadius.circular(7)),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ));
//   },
//   child: Column(
//     children: [
//       Container(
//         width: double.maxFinite,
//         child: Row(
//           children: [
//             Container(
//               height: dimension.height80,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Image(
//                     image: AssetImage(
//                         "assets/category/category_drill.png")),
//               ),
//             ),
//             SizedBox(
//               width: dimension.height20,
//             ),
//             Text(
//               "Plumber",
//               style: GoogleFonts.poppins(
//                   color: AppColors.Colorq,
//                   fontSize: dimension.height20,
//                   fontWeight: FontWeight.w400),
//             )
//           ],
//         ),
//         decoration: BoxDecoration(
//             color: AppColors.Colorq.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(7)),
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: dimension.height10,
// ),
// Bounce(
//   duration: Duration(milliseconds: 200),
//   onPressed: () {
//     Get.bottomSheet(
//         isDismissible: true,
//         Container(
//           height: 285,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10))),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "Electrician, Plumber & Carpenters",
//                   style: GoogleFonts.poppins(
//                       color: AppColors.Colorq,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w300),
//                 ),
//               ),
//               Container(
//                 height: 245,
//                 child: GridView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate:
//                       SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3, childAspectRatio: 1.7),
//                   itemCount: 8,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Container(
//                             // height: 40,
//                             // width: 80,
//                             decoration: BoxDecoration(
//                                 color: AppColors.Colorq.withOpacity(
//                                     0.5),
//                                 borderRadius:
//                                     BorderRadius.circular(7)),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ));
//   },
//   child: Column(
//     children: [
//       Container(
//         width: double.maxFinite,
//         child: Row(
//           children: [
//             Container(
//               height: dimension.height80,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image(
//                     image: AssetImage(
//                         "assets/category/category_acc1.png")),
//               ),
//             ),
//             SizedBox(
//               width: dimension.height20,
//             ),
//             Text(
//               "Ac & Appliance Repair",
//               style: GoogleFonts.poppins(
//                   color: AppColors.Colorq,
//                   fontSize: dimension.height20,
//                   fontWeight: FontWeight.w400),
//             )
//           ],
//         ),
//         decoration: BoxDecoration(
//             color: AppColors.Colorq.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(7)),
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: dimension.height10,
// ),
// Bounce(
//   duration: Duration(milliseconds: 200),
//   onPressed: () {
//     Get.bottomSheet(
//         isDismissible: true,
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Bounce(
//                 duration: Duration(milliseconds: 200),
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColors.Colorq,
//                     ),
//                     child: Icon(Icons.cancel,
//                         color: AppColors.white1, size: 30)),
//               ),
//             ),
//             Container(
//               height: 291,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10))),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Home Painting",
//                       style: GoogleFonts.poppins(
//                           color: AppColors.Colorq,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Container(
//                     height: 245,
//                     child: GridView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate:
//                           SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               childAspectRatio: 1.7),
//                       itemCount: 8,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             // height: 40,
//                             // width: 80,
//                             decoration: BoxDecoration(
//                                 color: AppColors.Colorq.withOpacity(
//                                     0.5),
//                                 borderRadius:
//                                     BorderRadius.circular(7)),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ));
//   },
//   child: Column(
//     children: [
//       Container(
//         width: double.maxFinite,
//         child: Row(
//           children: [
//             Container(
//               height: dimension.height80,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Image(
//                     image: AssetImage(
//                         "assets/category/category_paint.jpg")),
//               ),
//             ),
//             SizedBox(
//               width: dimension.height20,
//             ),
//             Text(
//               "Home Painting",
//               style: GoogleFonts.poppins(
//                   color: AppColors.Colorq,
//                   fontSize: dimension.height20,
//                   fontWeight: FontWeight.w400),
//             )
//           ],
//         ),
//         decoration: BoxDecoration(
//             color: AppColors.Colorq.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(7)),
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: dimension.height10,
// ),
// Bounce(
//   duration: Duration(milliseconds: 200),
//   onPressed: () {
//     Get.bottomSheet(
//         isDismissible: true,
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Bounce(
//                 duration: Duration(milliseconds: 200),
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColors.Colorq,
//                     ),
//                     child: Icon(Icons.cancel,
//                         color: AppColors.white1, size: 30)),
//               ),
//             ),
//             Container(
//               height: 291,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10))),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Demo",
//                       style: GoogleFonts.poppins(
//                           color: AppColors.Colorq,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Container(
//                     height: 245,
//                     child: GridView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       gridDelegate:
//                           SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               childAspectRatio: 1.7),
//                       itemCount: 8,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             // height: 40,
//                             // width: 80,
//                             decoration: BoxDecoration(
//                                 color: AppColors.Colorq.withOpacity(
//                                     0.5),
//                                 borderRadius:
//                                     BorderRadius.circular(7)),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ));
//   },
//   child: Column(
//     children: [
//       Container(
//         width: double.maxFinite,
//         child: Row(
//           children: [
//             Container(
//               height: dimension.height80,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Image(
//                     image: AssetImage(
//                         "assets/category/category_paint.jpg")),
//               ),
//             ),
//             SizedBox(
//               width: dimension.height20,
//             ),
//             Text(
//               "Demo ",
//               style: GoogleFonts.poppins(
//                   color: AppColors.Colorq,
//                   fontSize: dimension.height20,
//                   fontWeight: FontWeight.w400),
//             )
//           ],
//         ),
//         decoration: BoxDecoration(
//             color: AppColors.Colorq.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(7)),
//       ),
//     ],
//   ),
// ),
