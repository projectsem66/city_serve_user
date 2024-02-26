
import 'package:city_serve/src/page/studioPages/women/salonPages/bleachPage.dart';
import 'package:city_serve/src/page/studioPages/women/salonPages/haircarePage.dart';
import 'package:city_serve/src/page/studioPages/women/salonPages/manicurePage.dart';
import 'package:city_serve/src/page/studioPages/women/salonPages/painreliefPage.dart';
import 'package:city_serve/src/page/studioPages/women/salonPages/pedicurePage.dart';
import 'package:city_serve/src/page/studioPages/women/salonPages/waxingPage.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

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
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: wSalon.length,
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
                    Get.to(wSalon[index]["page"]);
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
                                image: AssetImage(wSalon[index]["srvImage"]))),
                      ),
                      SizedBox(
                        height: dimension.height5,
                      ),
                      Text(
                        wSalon[index]["srvName"],
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
