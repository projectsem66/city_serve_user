import 'package:city_serve/src/page/studioPages/women/salonPages/bleachPage.dart';
import 'package:city_serve/src/page/studioPages/women/salonPages/haircarePage.dart';
import 'package:city_serve/src/page/studioPages/women/salonPages/manicurePage.dart';
import 'package:city_serve/src/page/studioPages/women/salonPages/painreliefPage.dart';
import 'package:city_serve/src/page/studioPages/women/salonPages/pedicurePage.dart';
import 'package:city_serve/src/page/studioPages/women/salonPages/waxingPage.dart';
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

class WSalon extends StatefulWidget {
  const WSalon({super.key});

  @override
  State<WSalon> createState() => _WSalonState();
}

List wSalon = [
  {
    "srvName": "Waxing",
    "srvImage": "assets/dashboard/studio/salonWomen/1salon.jpg",
    "page": WaxingPage(),
  },
  {
    "srvName": "Manicure",
    "srvImage": "assets/dashboard/studio/salonWomen/3salon.jpg",
    "page": ManicurePage(),
  },
  {
    "srvName": "Pedicure",
    "srvImage": "assets/dashboard/studio/salonWomen/4salon.jpg",
    "page": PedicurePage(),
  },
  {
    "srvName": "Bleach & Detan",
    "srvImage": "assets/dashboard/studio/salonWomen/5salon.jpg",
    "page": BleachPage(),
  },
  {
    "srvName": "Haircare",
    "srvImage": "assets/dashboard/studio/salonWomen/6salon.jpg",
    "page": HaircarePage(),
  },
  {
    "srvName": "Pain relief",
    "srvImage": "assets/dashboard/studio/salonWomen/7salon.jpg",
    "page": PainreliefPage(),
  },
];

class _WSalonState extends State<WSalon> {
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
            "Salon for Women",
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
                .doc("Women's Salon & Spa")
                .collection("subcategories")
                .doc("Salon for Women")
                .collection("sections")
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return GridView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 0.92
                      // Number of columns
                      ),
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Bounce(
                      duration: Duration(milliseconds: 200),
                      onPressed: () {
                        sectionName = documentSnapshot.id;
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
                                  borderRadius:
                                      BorderRadius.circular(dimension.height7),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          documentSnapshot['simage']
                                              .toString()),
                                      fit: BoxFit.cover),
                                )),
                            Container(
                              height: dimension.height45,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  documentSnapshot['sname'].toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.height14,
                                      fontWeight: FontWeight.w400),
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
