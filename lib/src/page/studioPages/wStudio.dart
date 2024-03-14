
import 'package:city_serve/src/page/studioPages/women/WstudioPages/bestSeller.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/blowDryPage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/cutStylePage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/fashionColorPage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/hairCarePage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/keratinPage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/monthlyColorPage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/trimPage.dart';
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

class WStudio extends StatefulWidget {
  const WStudio({super.key});

  @override
  State<WStudio> createState() => _WStudioState();
}

List wStudio = [
  {
    "srvName": "Bestsellers",
    "srvImage": "assets/dashboard/studio/HairStudioWomen/1hair.jpg",
    "page": BestSellerPage(),
  },
  {
    "srvName": "Blow dry & style",
    "srvImage": "assets/dashboard/studio/HairStudioWomen/2hair.jpg",
    "page": BlowDryPage(),
  },
  {
    "srvName": "Cut & Style",
    "srvImage": "assets/dashboard/studio/HairStudioWomen/3hair.jpg",
    "page": CutStylePage(),
  },
  {
    "srvName": "Trim & Style",
    "srvImage": "assets/dashboard/studio/HairStudioWomen/4hair.jpg",
    "page": TrimPage(),
  },
  {
    "srvName": "Hair care",
    "srvImage": "assets/dashboard/studio/HairStudioWomen/5hair.jpg",
    "page": HairCarePage(),
  },
  {
    "srvName": "Keratin & hair botox",
    "srvImage": "assets/dashboard/studio/HairStudioWomen/6hair.jpg",
    "page": KeratinPage(),
  },
  {
    "srvName": "Monthly color",
    "srvImage": "assets/dashboard/studio/HairStudioWomen/7hair.jpg",
    "page": MonthlyColorPage(),
  },
  {
    "srvName": "Fashion color",
    "srvImage": "assets/dashboard/studio/HairStudioWomen/8hair.jpg",
    "page": FashionColorPage(),
  },
];

class _WStudioState extends State<WStudio> {
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
            "Hair studio  for Women",
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
                .doc("Women's Salon & Spa")
                .collection("subcategories")
                .doc("Hair Studio for Women")
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
