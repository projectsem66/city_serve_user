import 'package:city_serve/src/page/bookingPages/bookingSubPage.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../btm_controller.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex1 = 0;
                _.currentIndex = 0;
                _.update();
                print(_currentIndex1);
              });
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Bookings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Bounce(
                duration: Duration(milliseconds: 200),
                onPressed: () {
                    Get.to(BookingSubPage());
                },
                child: Container(
                  // height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppColors.Colorq, width: 1)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/dashboard/mostBook/1u.jpg")),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.red.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(7),
                                          border:
                                              Border.all(color: AppColors.red)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 4),
                                        child: Text(
                                          "Pending",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.red,
                                              fontSize: dimension.height14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          dimension.width100 + dimension.width27,
                                    ),
                                    Text(
                                      "#202",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.height14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Filter Replacement",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.height18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.Colorq.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Service Charge",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.height14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "₹500",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.height14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Divider(thickness: 1),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Date & Time",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.height14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "xyz xyz",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.height14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Divider(thickness: 1),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Provider",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.height14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "xyz xyz",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.height14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
