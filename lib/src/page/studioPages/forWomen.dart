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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Get.back();
              });
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text(
          "Women",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
