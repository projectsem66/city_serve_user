import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_serve/src/page/studioPages/wSalon.dart';
import 'package:city_serve/src/page/studioPages/wSpa.dart';
import 'package:city_serve/src/page/studioPages/wStudio.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class ForWomen extends StatefulWidget {
  const ForWomen({super.key});

  @override
  State<ForWomen> createState() => _ForWomenState();
}

class _ForWomenState extends State<ForWomen> {
  bool spa = true;
  bool salon = false;
  bool studio = false;

  List wSlider = [
    "assets/dashboard/studio/womenslider/stdslider.jpg",
    "assets/dashboard/studio/womenslider/stdslider2.jpg",
    "assets/dashboard/studio/womenslider/stdslider7.jpg",
    "assets/dashboard/studio/womenslider/stdslider3.jpg",
    "assets/dashboard/studio/womenslider/stdslider4.jpg",
    "assets/dashboard/studio/womenslider/stdslider8.jpg",
    "assets/dashboard/studio/womenslider/stdslider5.jpg",
    "assets/dashboard/studio/womenslider/stdslider6.jpg",
    "assets/dashboard/studio/womenslider/stdslider9.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: GestureDetector(
      //       onTap: () {
      //         setState(() {
      //           Get.back();
      //         });
      //       },
      //       child: Icon(Icons.arrow_back)),
      //   backgroundColor: AppColors.Colorq,
      //   centerTitle: false,
      //   title: Text(
      //     "Studio for Women" ,
      //     style: GoogleFonts.poppins(
      //         color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(


            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: dimension.height100 + dimension.height100,
                      child: CarouselSlider.builder(
                        carouselController: CarouselController(),
                        itemCount: wSlider.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(dimension.height7),
                              image: DecorationImage(
                                  image: AssetImage(
                                    wSlider[index],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeFactor: 0,
                          scrollDirection: Axis.horizontal,
                          autoPlayInterval: Duration(seconds: 8),
                          autoPlayCurve: Curves.ease,
                          enableInfiniteScroll: true,
                          height: dimension.height100 * 2.5,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          autoPlayAnimationDuration: const Duration(seconds: 4),
                          animateToClosest: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              print(index);
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Bounce(
                        onPressed: () {
                          Get.back();
                        },
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.Colorq.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.arrow_back,
                            color: AppColors.Colorq,
                            size: dimension.height28,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Bounce(
                          duration: Duration(milliseconds: 200),
                          onPressed: () {
                            spa = true;
                            studio = false;
                            salon = false;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: spa == true
                                //       ? AppColors.Colorq
                                //       : Colors.transparent,
                                // ),
                                // color: AppColors.Colorq.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: dimension.height60,
                                    width: dimension.height80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/dashboard/studio/spaStd.jpg"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  SizedBox(
                                    height: dimension.height10,
                                  ),
                                  Text(
                                    "Spa",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.Colorq,
                                        fontSize: dimension.height18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    height: dimension.height4,
                                    width: dimension.height80,
                                    color: spa == true
                                        ? AppColors.Colorq
                                        : Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Bounce(
                          duration: Duration(milliseconds: 200),
                          onPressed: () {
                            spa = false;
                            studio = false;
                            salon = true;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: spa == true
                                //       ? AppColors.Colorq
                                //       : Colors.transparent,
                                // ),
                                // color: AppColors.Colorq.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: dimension.height60,
                                    width: dimension.height80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/dashboard/studio/salonW.jpg"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    height: dimension.height10,
                                  ),
                                  Text(
                                    "Salon",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.Colorq,
                                        fontSize: dimension.height18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    height: dimension.height4,
                                    width: dimension.height80,
                                    color: salon == true
                                        ? AppColors.Colorq
                                        : Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {
                          spa = false;
                          studio = true;
                          salon = false;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: spa == true
                              //       ? AppColors.Colorq
                              //       : Colors.transparent,
                              // ),
                              // color: AppColors.Colorq.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  height: dimension.height60,
                                  width: dimension.height80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/dashboard/studio/studioStd.jpg"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                SizedBox(
                                  height: dimension.height10,
                                ),
                                Text(
                                  "Hair studio",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.height18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: dimension.height4,
                                  width: dimension.height80,
                                  color: studio == true
                                      ? AppColors.Colorq
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: dimension.height20,
                ),
                getCategory(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getCategory() {
    if (spa == true) {
      return WSpa();
    }
    if (salon == true) {
      return WSalon();
    }
    if (studio == true) {
      return WStudio();
    }
  }
}
