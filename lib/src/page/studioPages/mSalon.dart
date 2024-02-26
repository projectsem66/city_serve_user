import 'package:city_serve/src/page/studioPages/men/salonPages/detanPage.dart';
import 'package:city_serve/src/page/studioPages/men/salonPages/facialPage.dart';
import 'package:city_serve/src/page/studioPages/men/salonPages/hairColorPage.dart';
import 'package:city_serve/src/page/studioPages/men/salonPages/haircutPage.dart';
import 'package:city_serve/src/page/studioPages/men/salonPages/massagePage.dart';
import 'package:city_serve/src/page/studioPages/men/salonPages/pedicurePage.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

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
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: mSalon.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(dimension.height7),
                child: Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    Get.to(mSalon[index]["page"]);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(dimension.height7),
                            image: DecorationImage(
                                image: AssetImage(mSalon[index]["srvImage"]))),
                      ),
                      SizedBox(
                        height: dimension.height5,
                      ),
                      Text(
                        mSalon[index]["srvName"],
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
