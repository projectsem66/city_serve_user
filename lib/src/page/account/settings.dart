import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text(
          "Setting",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: dimension.height15,
            ),
            Bounce(
              duration: Duration(milliseconds: 400),
              onPressed: () {
                print("tapped");
                Get.defaultDialog(
                  // ScaffoldKey.currentState?.openEndDrawer();
                  buttonColor: AppColors.Colorq,
                  backgroundColor: Colors.white,
                  cancelTextColor: AppColors.Colorq,
                  titleStyle: GoogleFonts.amaranth(
                      fontSize: 28, color: AppColors.Colorq),
                  titlePadding: EdgeInsets.all(10),
                  title: "Delete Account",
                  // contentPadding: EdgeInsets.all(),
                  // middleText: "Are you sure to delete",
                  content: Column(
                    children: [
                      Text(
                        "Are you sure you want to Delete Account?",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  textConfirm: "Yes",
                  textCancel: "Noo",
                  confirm: TextButton(
                    onPressed: () async {},
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          // color: AppColors.orange,
                          border: Border.all(color: AppColors.Colorq, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "No",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  cancel: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: AppColors.Colorq,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Yes",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )),
                );
              },
              child: Container(
                height: dimension.height50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.red, width: 2),
                  color: AppColors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    "Delete Account",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
