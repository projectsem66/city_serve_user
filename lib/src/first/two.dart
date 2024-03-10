import 'package:city_serve/src/first/three.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../authentication/login.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({super.key});

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
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
                  Image(image: AssetImage("assets/two.jpg"), fit: BoxFit.cover),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: dimension.height100+dimension.height66,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: dimension.height100 * 5,
                      //   width: double.maxFinite,
                      //   color: AppColors.Colorq.withOpacity(0.6),
                      // ),
                      Text(
                        "Find your Services & Facilities",
                        style: GoogleFonts.poppins(
                          color: AppColors.Colorq,
                          fontSize: dimension.height24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: dimension.height20,
                      ),
                      Text(
                        "find a service as per your preference and take advantages of it",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height15 ,
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
                              Get.off(() => Login(),
                                  transition: Transition.downToUp);
                            },
                            child: Text(
                              "Skip",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height15,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Bounce(
                            duration: Duration(milliseconds: 400),
                            onPressed: () {
                              print("tapped");
                              Get.to(() => ThreePage(),
                                  transition: Transition.rightToLeft);
                            },
                            child: Text(
                              "Next",
                              style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height15,
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
