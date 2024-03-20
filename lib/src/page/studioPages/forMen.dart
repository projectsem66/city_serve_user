import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import 'mMassage.dart';
import 'mSalon.dart';

class ForMen extends StatefulWidget {
  const ForMen({super.key});

  @override
  State<ForMen> createState() => _ForMenState();
}

bool mMassage = true;
bool mSalon = false;

class _ForMenState extends State<ForMen> {
  List mSlider = [
    "assets/dashboard/studio/menslider/stdmen.jpg",
    "assets/dashboard/studio/menslider/stdmen2.jpg",
    "assets/dashboard/studio/menslider/stdmen3.jpg",
    "assets/dashboard/studio/menslider/stdmen6.jpg",
    "assets/dashboard/studio/menslider/stdmen4.jpg",
    "assets/dashboard/studio/menslider/stdmen5.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: dimension.height100 + dimension.height100,
                      child: Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: CarouselSlider.builder(
                          carouselController: CarouselController(),
                          itemCount: mSlider.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(dimension.height7),
                                image: DecorationImage(
                                    image: AssetImage(mSlider[index]),
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
                                // _currentIndex = index;
                                //sliderIndex = index;
                                print(index);
                              });
                            },
                          ),
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
                                Icons.arrow_back_ios_outlined,
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
                      child: Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {
                          mMassage = true;
                          mSalon = false;
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
                                            "assets/dashboard/studio/massageMstd.jpg"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                SizedBox(
                                  height: dimension.height10,
                                ),
                                Text(
                                  "Massage",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.height18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: dimension.height4,
                                  width: dimension.height80,
                                  color: mMassage == true
                                      ? AppColors.Colorq
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {
                          mMassage = false;
                          mSalon = true;
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
                                            "assets/dashboard/studio/salonMstd.jpg"),
                                        fit: BoxFit.fill),
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
                                  color: mSalon == true
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
    if (mMassage == true) {
      return MMassage();
    }
    if (mSalon == true) {
      return MSalon();
    }
  }
}
