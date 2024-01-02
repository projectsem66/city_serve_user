import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

List sliderImages = [
  "assets/dashboard/slider1.jpg",
  "assets/dashboard/slider2.jpg",
  "assets/dashboard/slider3.jpg",
];

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  carouselController: CarouselController(),
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(sliderImages[index]))),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeFactor: 0.2,
                    scrollDirection: Axis.horizontal,
                    autoPlayInterval: Duration(seconds: 8),
                    autoPlayCurve: Curves.ease,
                    enableInfiniteScroll: true,
                    height: dimension.height100 * 2,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: const Duration(seconds: 4),
                    animateToClosest: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        // _currentIndex = index;
                        print(index);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.Colorq.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Search here..",
                      hintStyle: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.Colorq.withOpacity(0.7)),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, bottom: 5),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 5, bottom: 5, top: 5),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, bottom: 5, right: 5, top: 5),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Text(
                  "Final experience",
                  style: GoogleFonts.pacifico(
                      color: AppColors.Colorq,
                      fontSize: dimension.height25,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Container(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: dimension.width5),
                        child: Container(
                          height: 200,
                          width: 130,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Text(
                  "Most booked service",
                  style: GoogleFonts.amaranth(
                      color: AppColors.Colorq,
                      fontSize: dimension.height25,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: dimension.width5),
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColors.Colorq.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Text(
                  "Spa for women",
                  style: GoogleFonts.amaranth(
                      color: AppColors.Colorq,
                      fontSize: dimension.height25,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                SizedBox(
                  height: 135,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: dimension.width5),
                        child: Container(
                          width: 135,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Text(
                  "Cleaning & post control",
                  style: GoogleFonts.amaranth(
                      color: AppColors.Colorq,
                      fontSize: dimension.height25,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                SizedBox(
                  height: 145,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: dimension.width5),
                        child: Container(
                          width: 145,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Text(
                  "Quick home repairs",
                  style: GoogleFonts.amaranth(
                      color: AppColors.Colorq,
                      fontSize: dimension.height25,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                SizedBox(
                  height: 135,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: dimension.width5),
                        child: Container(
                          width: 135,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Text(
                  "AC & appliance repairs",
                  style: GoogleFonts.amaranth(
                      color: AppColors.Colorq,
                      fontSize: dimension.height25,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                SizedBox(
                  height: 155,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: dimension.width5),
                        child: Container(
                          width: 145,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
