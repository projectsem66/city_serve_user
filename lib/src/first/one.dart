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
        child: Stack(

           children: [
             Container(
               height: screenheight(),
               width: screenwidth(),
               child: Image(image: AssetImage("assets/one.jpg"),fit: BoxFit.cover),
             ),
             Align(
               alignment: AlignmentDirectional.bottomCenter,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   height: 166,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       // Container(
                       //   height: dimension.height100 * 5,
                       //   width: double.maxFinite,
                       //   color: AppColors.Colorq.withOpacity(0.6),
                       // ),
                       Text(
                         "Welcome to cityServe service",
                         style: GoogleFonts.poppins(
                             color: AppColors.Colorq,
                             fontSize: 24,
                             fontWeight: FontWeight.w400),
                       ),
                       SizedBox(
                         height: dimension.height20,
                       ),
                       Text(
                         "CityServe service - On-demand Home service app with complete solution",
                         style: GoogleFonts.poppins(
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
                               Get.to(() => Login(),transition: Transition.downToUp);
                             },
                             child: Text(
                               "Skip",
                               style: GoogleFonts.poppins(
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
                               style: GoogleFonts.poppins(
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
             ),
           ],
        ),
      ),
    );
  }
}
