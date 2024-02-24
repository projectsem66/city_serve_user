import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                // _currentIndex1 = 0;
                // _.currentIndex = 0;
                // _.update();
                // print(_currentIndex1);
                Get.back();
              });
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Summary"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                // color: Colors.yellowAccent,
                height: screenheight() - dimension.height100 * 1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: dimension.height15,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.Colorq),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                                child: Icon(
                              Icons.percent,
                              color: Colors.white,
                            )),
                          ),
                        ),
                        SizedBox(
                          width: dimension.height10,
                        ),
                        Text(
                          "Coupons and Offers",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Bounce(
                          duration: Duration(milliseconds: 200),
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
                                ),);
                          },
                          child: Text(
                            "Offers >",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: dimension.height30,
                    ),
                    Text(
                      "Payment Summary",
                      style: GoogleFonts.poppins(
                          color: AppColors.Colorq,
                          fontSize: dimension.height18,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item total",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "₹700",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coupon discount",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "₹70",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "₹770",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(height: dimension.height30),
                    Text(
                      "Cancellation & Reschedule  Policy",
                      style: GoogleFonts.poppins(
                          color: AppColors.Colorq,
                          fontSize: dimension.height18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: dimension.height5,),
                    Text(
                      "Free cancellation if done more than 3 hrs before the service or if professional not provided",
                      style: GoogleFonts.poppins(
                          color: AppColors.Colorq,
                          fontSize: dimension.height16,
                          fontWeight: FontWeight.w400),
                    ),
                    Bounce(
                      duration: Duration(milliseconds: 200),
                      onPressed: () {
                        Get.bottomSheet(
                            isDismissible: true,
                            Container(
                              height: dimension.height100 * 2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, right: 10, left: 10),
                                child: Text(
                                  "You will be charged a cancellation fee if you cancel or reschedule your appointment without giving a minimum of 3 hrs notice prior to the start of the appointment. The cancellation fee will be up to 100 rs of the amount. Thank you! ",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.height16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ));
                      },
                      child: Text(
                        "Learn more",
                        style: GoogleFonts.poppins(
                            decoration: TextDecoration.underline,
                            color: AppColors.Colorq,
                            fontSize: dimension.height16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Bounce(
                duration: Duration(milliseconds: 200),
                onPressed: () {
                  Get.to(Summary(),transition: Transition.cupertino);
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.Colorq,
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    child: Center(
                      child: Text(
                        "Add Address & Slot",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
