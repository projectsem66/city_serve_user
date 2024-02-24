import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
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
