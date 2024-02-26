import 'package:city_serve/src/page/studioPages/forMen.dart';
import 'package:city_serve/src/page/studioPages/forWomen.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Bounce(
              duration: Duration(milliseconds: 200),
              onPressed: () {
                Get.bottomSheet(
                    isDismissible: true,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq,
                                ),
                                child: Icon(Icons.cancel,
                                    color: AppColors.white1, size: 30)),
                          ),
                        ),
                        Container(
                          height: 291,
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
                                  "Salon for Men",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                height: 245,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 1.7),
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Bounce(
                                        duration: Duration(milliseconds: 200),
                                        onPressed: () {
                                          if (index == 0) {
                                            mMassage = true;
                                            mSalon = false;
                                          }
                                          if (index == 1) {
                                            mSalon = true;
                                            mMassage = false;
                                          }

                                          Get.back();
                                          Get.to(ForMen());
                                        },
                                        child: Container(
                                          // height: 40,
                                          // width: 80,
                                          decoration: BoxDecoration(
                                              color:
                                                  AppColors.Colorq.withOpacity(
                                                      0.5),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              },
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Container(
                          height: dimension.height80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                image: AssetImage(
                                    "assets/category/category_man(rotate).jpg")),
                          ),
                        ),
                        SizedBox(
                          width: dimension.height20,
                        ),
                        Text(
                          "Salon for Men",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height20,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.Colorq.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: dimension.height10,
            ),
            Bounce(
              duration: Duration(milliseconds: 200),
              onPressed: () {
                Get.bottomSheet(
                    isDismissible: true,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq,
                                ),
                                child: Icon(Icons.cancel,
                                    color: AppColors.white1, size: 30)),
                          ),
                        ),
                        Container(
                          height: 291,
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
                                  "Salon for Women",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                height: 245,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 1.7),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Bounce(
                                        duration: Duration(milliseconds: 200),
                                        onPressed: () {
                                          if (index == 0) {
                                            wSpa = true;
                                            wSalon = false;
                                            wStudio = false;
                                          }
                                          if (index == 1) {
                                            wSpa = false;
                                            wSalon = true;
                                            wStudio = false;
                                          }
                                          if (index == 2) {
                                            wSpa = false;
                                            wSalon = false;
                                            wStudio = true;
                                          }
                                          Get.back();
                                          Get.to(ForWomen());
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  AppColors.Colorq.withOpacity(
                                                      0.5),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              },
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Container(
                          height: dimension.height80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                image: AssetImage(
                                    "assets/category/category_women.jpg")),
                          ),
                        ),
                        SizedBox(
                          width: dimension.height20,
                        ),
                        Text(
                          "Salon for Women",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height20,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.Colorq.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: dimension.height10,
            ),
            Bounce(
              duration: Duration(milliseconds: 200),
              onPressed: () {
                Get.bottomSheet(
                    isDismissible: true,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq,
                                ),
                                child: Icon(Icons.cancel,
                                    color: AppColors.white1, size: 30)),
                          ),
                        ),
                        Container(
                          height: 291,
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
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                height: 245,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 1.7),
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // height: 40,
                                        // width: 80,
                                        decoration: BoxDecoration(
                                            color: AppColors.Colorq.withOpacity(
                                                0.5),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              },
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Container(
                          height: dimension.height80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                image: AssetImage(
                                    "assets/category/category_plumber.jpg")),
                          ),
                        ),
                        SizedBox(
                          width: dimension.height20,
                        ),
                        Text(
                          "Cleaning",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height20,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.Colorq.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: dimension.height10,
            ),
            Bounce(
              duration: Duration(milliseconds: 200),
              onPressed: () {
                Get.bottomSheet(
                    isDismissible: true,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq,
                                ),
                                child: Icon(Icons.cancel,
                                    color: AppColors.white1, size: 30)),
                          ),
                        ),
                        Container(
                          height: 291,
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
                                  "Plumber",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                height: 245,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 1.7),
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // height: 40,
                                        // width: 80,
                                        decoration: BoxDecoration(
                                            color: AppColors.Colorq.withOpacity(
                                                0.5),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              },
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Container(
                          height: dimension.height80,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image(
                                image: AssetImage(
                                    "assets/category/category_drill.png")),
                          ),
                        ),
                        SizedBox(
                          width: dimension.height20,
                        ),
                        Text(
                          "Plumber",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height20,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.Colorq.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: dimension.height10,
            ),
            Bounce(
              duration: Duration(milliseconds: 200),
              onPressed: () {
                Get.bottomSheet(
                    isDismissible: true,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq,
                                ),
                                child: Icon(Icons.cancel,
                                    color: AppColors.white1, size: 30)),
                          ),
                        ),
                        Container(
                          height: 291,
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
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                height: 245,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 1.7),
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // height: 40,
                                        // width: 80,
                                        decoration: BoxDecoration(
                                            color: AppColors.Colorq.withOpacity(
                                                0.5),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              },
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Container(
                          height: dimension.height80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                image: AssetImage(
                                    "assets/category/category_acc1.png")),
                          ),
                        ),
                        SizedBox(
                          width: dimension.height20,
                        ),
                        Text(
                          "Ac & Appliance Repair",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height20,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.Colorq.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: dimension.height10,
            ),
            Bounce(
              duration: Duration(milliseconds: 200),
              onPressed: () {
                Get.bottomSheet(
                    isDismissible: true,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq,
                                ),
                                child: Icon(Icons.cancel,
                                    color: AppColors.white1, size: 30)),
                          ),
                        ),
                        Container(
                          height: 291,
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
                                  "Home Painting",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                height: 245,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 1.7),
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // height: 40,
                                        // width: 80,
                                        decoration: BoxDecoration(
                                            color: AppColors.Colorq.withOpacity(
                                                0.5),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              },
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Container(
                          height: dimension.height80,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image(
                                image: AssetImage(
                                    "assets/category/category_paint.jpg")),
                          ),
                        ),
                        SizedBox(
                          width: dimension.height20,
                        ),
                        Text(
                          "Home Painting",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height20,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.Colorq.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
