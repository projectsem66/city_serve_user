import 'package:city_serve/src/page/studioPages/men/salonPages/detanPage.dart';
import 'package:city_serve/src/page/studioPages/men/salonPages/facialPage.dart';
import 'package:city_serve/src/page/studioPages/men/salonPages/hairColorPage.dart';
import 'package:city_serve/src/page/studioPages/men/salonPages/haircutPage.dart';
import 'package:city_serve/src/page/studioPages/men/salonPages/massagePage.dart';
import 'package:city_serve/src/page/studioPages/men/salonPages/pedicurePage.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../firebaseService/fbRefrences.dart';
import '../../../utils/colors.dart';
import '../category.dart';
import '../servicesPage.dart';

class MSalon extends StatefulWidget {
  const MSalon({super.key});

  @override
  State<MSalon> createState() => _MSalonState();
}

List mSalon = [
  {
    "srvName": "pedicure",
    "srvImage": "assets/dashboard/studio/salonMen/1slnmen.jpg",
    "page": PedicurePage(),
  },
  {
    "srvName": "haircut & beard stylin",
    "srvImage": "assets/dashboard/studio/salonMen/2slnmen.jpg",
    "page": HaircutPage(),
  },
  {
    "srvName": "facial & cleanup",
    "srvImage": "assets/dashboard/studio/salonMen/3slnmen.jpg",
    "page": FacialPage(),
  },
  {
    "srvName": "detan",
    "srvImage": "assets/dashboard/studio/salonMen/4slnmen.jpg",
    "page": DetanPage(),
  },
  {
    "srvName": "hair color",
    "srvImage": "assets/dashboard/studio/salonMen/5slnmen.jpg",
    "page": HairColorPage(),
  },
  {
    "srvName": "massage",
    "srvImage": "assets/dashboard/studio/salonMen/6slnmen.jpg",
    "page": MassagePage(),
  },
];

class _MSalonState extends State<MSalon> {
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
            "Massage for Men",
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
          child: StreamBuilder(
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
