import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class WSpa extends StatefulWidget {
  const WSpa({super.key});

  @override
  State<WSpa> createState() => _WSpaState();
}

List wSpa = [
  {
    "srvName": "Pain relief",
    "srvImage": "assets/dashboard/studio/spaWomen/1spa.jpg"
  },
  {
    "srvName": "Stress relief",
    "srvImage": "assets/dashboard/studio/spaWomen/2spa.jpg"
  },
  {
    "srvName": "Skin care scrub",
    "srvImage": "assets/dashboard/studio/spaWomen/3spa.jpg"
  },
  {
    "srvName": "Add ons",
    "srvImage": "assets/dashboard/studio/spaWomen/4spa.jpg"
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
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: wSpa.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(dimension.height7),
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
                              image: AssetImage(wSpa[index]["srvImage"]))),
                    ),
                    SizedBox(
                      height: dimension.height5,
                    ),
                    Text(
                      wSpa[index]["srvName"],
                      style: GoogleFonts.poppins(
                          color: AppColors.Colorq,
                          fontSize: dimension.height16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
