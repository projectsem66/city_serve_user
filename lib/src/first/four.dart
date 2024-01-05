import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../login.dart';

class FourPage extends StatefulWidget {
  const FourPage({super.key});

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: screenheight(),
              width: screenwidth(),
              child:
                  Image(image: AssetImage("assets/four.jpg"), fit: BoxFit.cover),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 155,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: dimension.height100 * 5,
                      //   width: double.maxFinite,
                      //   color: AppColors.Colorq.withOpacity(0.6),
                      // ),
                      Text(
                        "Payment Gateway",
                        style: GoogleFonts.amaranth(
                            color: AppColors.Colorq,
                            fontSize: 24,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: dimension.height20,
                      ),
                      Text(
                        "Choose the preferable option of payment and get best service",
                        style: GoogleFonts.amaranth(
                            color: AppColors.Colorq,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Bounce(
                            duration: Duration(milliseconds: 400),
                            onPressed: () {
                              print("tapped");
                              Get.to(() => Login(),
                                  transition: Transition.downToUp);
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
                              Get.to(() => Login(),
                                  transition: Transition.downToUp);
                            },
                            child: Text(
                              "Next",
                              style: GoogleFonts.amaranth(
                                color: AppColors.Colorq,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
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
            ),
          ],
        ),
      ),
    );
  }
}
