import 'package:city_serve/src/first/two.dart';
import 'package:city_serve/src/login.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
                "Welcome to cityServe service",
                style: GoogleFonts.amaranth(
                    color: AppColors.Colorq,
                    fontSize: 24,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: dimension.height20,
              ),
              Text(
                "CityServe service - On-demand Home service app with complete solution",
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
                      Get.to(() => TwoPage(), transition: Transition.rightToLeft);
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
