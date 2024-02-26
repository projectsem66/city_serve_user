
import 'package:city_serve/src/page/studioPages/women/WstudioPages/bestSeller.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/blowDryPage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/cutStylePage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/fashionColorPage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/hairCarePage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/keratinPage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/monthlyColorPage.dart';
import 'package:city_serve/src/page/studioPages/women/WstudioPages/trimPage.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

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
          child: GridView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: wStudio.length,
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
                    Get.to(wStudio[index]["page"]);
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
                                image: AssetImage(wStudio[index]["srvImage"]))),
                      ),
                      SizedBox(
                        height: dimension.height5,
                      ),
                      Text(
                        wStudio[index]["srvName"],
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
