import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../dashboard.dart';
import 'mSalon.dart';
import 'mSpa.dart';

class ForMen extends StatefulWidget {
  const ForMen({super.key});

  @override
  State<ForMen> createState() => _ForMenState();
}

class _ForMenState extends State<ForMen> {
  bool spa = true;
  bool salon = false;

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
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text(
          "Men",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: dimension.height100 +
                    dimension.height100,
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: CarouselSlider.builder(
                    carouselController: CarouselController(),
                    itemCount: mSlider.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(dimension.height7),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Bounce(
                      duration: Duration(milliseconds: 200),
                      onPressed: () {
                        spa = true;
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
                                          "assets/dashboard/studio/massageMstd.jpg"),
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
                  Expanded(
                    child: Bounce(
                      duration: Duration(milliseconds: 200),
                      onPressed: () {
                        spa = false;
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
    );
  }

  getCategory() {
    if (spa == true) {
      return MSpa();
    }
    if (salon == true) {
      return MSalon();
    }
  }
}
