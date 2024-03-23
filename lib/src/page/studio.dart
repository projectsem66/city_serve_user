import 'package:city_serve/src/page/studioPages/forMen.dart';
import 'package:city_serve/src/page/studioPages/forWomen.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../btm_controller.dart';
import '../../utils/colors.dart';

class Studio extends StatefulWidget {
  const Studio({super.key});

  @override
  State<Studio> createState() => _StudioState();
}

BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;

class _StudioState extends State<Studio> {
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
        title: Text(
          "Studio",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: dimension.height22,
                fontWeight: FontWeight.w400)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Bounce(
              duration: Duration(milliseconds: 200),
              onPressed: () {
                Get.to(ForMen());
              },
              child: Animate(
                effects: [ShimmerEffect()],
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: dimension.height100+dimension.height20,
                          width: dimension.height100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/dashboard/studio/pr2.jpg"),
                                  fit: BoxFit.cover),
                              color: AppColors.Colorq.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(dimension.height7)),
                        ),
                        SizedBox(
                          width: dimension.height15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "For Men",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "( Salon, Spa )",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height14,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: dimension.height5,
            ),
            Bounce(
              duration: Duration(milliseconds: 200),
              onPressed: () {
                Get.to(ForWomen());
              },
              child: Animate(
                effects: [ShimmerEffect()],
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: dimension.height100+dimension.height20,
                          width: dimension.height100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/dashboard/studio/pr15.jpg"),
                                  fit: BoxFit.cover),
                              color: AppColors.Colorq.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(dimension.height7)),
                        ),
                        SizedBox(
                          width: dimension.height15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "For Women",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "( Salon, Spa, Hair Studio )",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height14,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
