import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
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
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.Colorq)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.Colorq)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.red.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: AppColors.red)),
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
                                height: 20,
                              ),
                              Text(
                                "Filter Replacement",
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: dimension.height18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.Colorq.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.Colorq)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Payment : ",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.Colorq,
                                        fontSize: dimension.height14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "₹ 500",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.Colorq,
                                        fontSize: dimension.height14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Provider : ",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.Colorq,
                                        fontSize: dimension.height14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Vedudi",
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
            ],
          ),
        ),
      ),
    );
  }
}
