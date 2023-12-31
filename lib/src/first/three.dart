import 'package:city_serve/src/first/four.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../login.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({super.key});

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: dimension.height100 * 5,
                width: double.maxFinite,
                color: AppColors.Colorq.withOpacity(0.6),
              ),
              SizedBox(
                height: dimension.height20,
              ),
              Text(
                "Book a service",
                style: GoogleFonts.amaranth(
                    color: AppColors.Colorq,
                    fontSize: 24,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: dimension.height20,
              ),
              Text(
                "Book Service on Your Time",
                style: GoogleFonts.amaranth(
                    color: AppColors.Colorq,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Bounce(
                    duration: Duration(milliseconds: 400),
                    onPressed: () {
                      print("tapped");
                      Get.to(() => Login(),transition: Transition.downToUp);
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 400),
                    onPressed: () {
                      print("tapped");
                      Get.to(() => FourPage(),
                          transition: Transition.rightToLeft);
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: dimension.height10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
