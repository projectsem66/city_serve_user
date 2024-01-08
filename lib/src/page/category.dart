import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class Categoryy extends StatefulWidget {
  const Categoryy({super.key});

  @override
  State<Categoryy> createState() => _CategoryyState();
}

class _CategoryyState extends State<Categoryy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Category"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Bounce(
              duration: Duration(milliseconds: 300),
              onPressed: () {
                Get.bottomSheet(
                    isDismissible: true,
                    Container(
                      height: 285,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "AC & Appliance Repair",
                              style: GoogleFonts.amaranth(
                                  color: AppColors.Colorq,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            height: 245,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, childAspectRatio: 1.7),
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // height: 40,
                                    // width: 80,
                                    decoration: BoxDecoration(
                                        color:
                                            AppColors.Colorq.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(7)),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ));
              },
              child: Container(
                height: dimension.height50,
                width: double.maxFinite,
                color: AppColors.Colorq.withOpacity(0.3),
                child: Center(child: Text("AC & Appliance Repair ")),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Bounce(
              duration: Duration(milliseconds: 300),
              onPressed: () {
                Get.bottomSheet(
                    isDismissible: true,
                    Container(
                      height: 285,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Cleaning",
                              style: GoogleFonts.amaranth(
                                  color: AppColors.Colorq,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            height: 245,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, childAspectRatio: 1.7),
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // height: 40,
                                    // width: 80,
                                    decoration: BoxDecoration(
                                        color:
                                            AppColors.Colorq.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(7)),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ));
              },
              child: Container(
                height: dimension.height50,
                width: double.maxFinite,
                color: AppColors.Colorq.withOpacity(0.3),
                child: Center(child: Text("Cleaning")),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Bounce(
              duration: Duration(milliseconds: 300),
              onPressed: () {
                Get.bottomSheet(
                    isDismissible: true,
                    Container(
                      height: 285,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Electrician, Plumber & Carpenters",
                              style: GoogleFonts.amaranth(
                                  color: AppColors.Colorq,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            height: 245,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, childAspectRatio: 1.7),
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // height: 40,
                                    // width: 80,
                                    decoration: BoxDecoration(
                                        color:
                                            AppColors.Colorq.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(7)),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ));
              },
              child: Container(
                height: dimension.height50,
                width: double.maxFinite,
                color: AppColors.Colorq.withOpacity(0.3),
                child: Center(child: Text("Electrician, Plumber & Carpenters")),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Bounce(
              duration: Duration(milliseconds: 100),
              onPressed: () {
                Get.bottomSheet(
                    isDismissible: true,
                    Container(
                      height: 285,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "AC & Appliance Repair",
                              style: GoogleFonts.amaranth(
                                  color: AppColors.Colorq,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            height: 245,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, childAspectRatio: 1.7),
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // height: 40,
                                    // width: 80,
                                    decoration: BoxDecoration(
                                        color:
                                            AppColors.Colorq.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(7)),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ));
              },
              child: Container(
                height: dimension.height50,
                width: double.maxFinite,
                color: AppColors.Colorq.withOpacity(0.3),
                child: Center(child: Text("AC & Appliance Repair ")),
              ),
            ),
          ),
          //
          // Container(
          //   height: dimension.height50,
          //   width: double.maxFinite,
          //   color: AppColors.Colorq,
          // ),
          // Container(
          //   height: dimension.height50,
          //   width: double.maxFinite,
          //   color: AppColors.Colorq,
          // ),
          // Container(
          //   height: dimension.height50,
          //   width: double.maxFinite,
          //   color: AppColors.Colorq,
          // ),
        ],
      ),
    );
  }
}
