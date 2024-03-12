
import 'package:city_serve/src/page/studioPages/women/spaPages/addOnsPage.dart';
import 'package:city_serve/src/page/studioPages/women/spaPages/painRelifePage.dart';
import 'package:city_serve/src/page/studioPages/women/spaPages/skinCarePage.dart';
import 'package:city_serve/src/page/studioPages/women/spaPages/stressReliePage.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../firebaseService/fbRefrences.dart';
import '../../../utils/colors.dart';
import '../category.dart';
import '../servicesPage.dart';

class WSpa extends StatefulWidget {
  const WSpa({super.key});

  @override
  State<WSpa> createState() => _WSpaState();
}

List wSpa = [
  {
    "srvName": "Pain relief",
    "srvImage": "assets/dashboard/studio/spaWomen/1spa.jpg",
    "page": PainRelifePage(),
  },
  {
    "srvName": "Stress relief",
    "srvImage": "assets/dashboard/studio/spaWomen/2spa.jpg",
    "page": StressReliefPage(),
  },
  {
    "srvName": "Skin care scrub",
    "srvImage": "assets/dashboard/studio/spaWomen/3spa.jpg",
    "page": SkinCarePage(),
  },
  {
    "srvName": "Add ons",
    "srvImage": "assets/dashboard/studio/spaWomen/4spa.jpg",
    "page": AddOnsPage(),
  },
];

class _WSpaState extends State<WSpa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: dimension.height5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Spa for Women",
            style: GoogleFonts.poppins(
                color: AppColors.Colorq,
                fontSize: dimension.height25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "★  4.83",
            style: GoogleFonts.poppins(
                color: AppColors.Colorq,
                fontSize: dimension.height16,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: dimension.height10,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.Colorq.withOpacity(0.1),
            borderRadius: BorderRadius.circular(7),
          ),
          height: dimension.height100 * 3 + dimension.height41,
          child:StreamBuilder(
            stream: refCategory
                .doc("men")
                .collection("subcategories")
                .doc("women")
                .collection("sections")
                .snapshots(),
            builder:
                (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return GridView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.92
                    // Number of columns
                  ),
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                    return Bounce(
                      duration: Duration(milliseconds: 200),
                      onPressed: () {
                        sectionName=documentSnapshot.id;
                        Get.back();
                        Get.to(ServicesPage());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(dimension.height7),
                                  image: DecorationImage(image: NetworkImage(documentSnapshot['simage'].toString()), fit: BoxFit.cover),
                                )),
                            Container(
                              height: dimension.height45,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  documentSnapshot['sname'].toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(color: AppColors.Colorq, fontSize: dimension.height14, fontWeight: FontWeight.w400),
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
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}
