import 'package:city_serve/src/location/googleLocation.dart';
import 'package:city_serve/src/login.dart';
import 'package:city_serve/src/page/account/TandC.dart';
import 'package:city_serve/src/page/account/aboutCs.dart';
import 'package:city_serve/src/page/account/privacyP.dart';
import 'package:city_serve/src/page/account/settings.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../btm_controller.dart';
import '../../../login/util.dart';
import '../../../utils/colors.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;
List accountList = [
  {
    "title": "Manage Address",
    "icon": Icons.location_on,
    "page":GoogleLocation()
  },
  {"title": "Terms and Conditions", "icon": Icons.feed_outlined,    "page":TandC()
  },
  {"title": "Privacy Policy", "icon": Icons.privacy_tip_outlined, "page":PrivacyP()},
  {"title": "About CS", "icon": Icons.auto_fix_high_outlined, "page":AboutCS()},
  {"title": "Settings", "icon": Icons.settings_suggest_sharp, "page":Settings()},
];

class _AccountState extends State<Account> {
  FirebaseAuth auth = FirebaseAuth.instance;

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
        title: Text("Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: dimension.height25,
            ),
            Center(
              child: Container(
                height: dimension.height100,
                width: dimension.height100,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              ),
            ),
            SizedBox(
              height: dimension.height25,
            ),
            Bounce(
              duration: Duration(milliseconds: 200),
              onPressed: () {
                setState(() {
                  _currentIndex1 = 1;
                  _.currentIndex = 1;
                  _.update();
                  print(_currentIndex1);
                });
              },
              child: Container(
                width: double.maxFinite,
                height: 50,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.event_note,
                        color: AppColors.Colorq,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "My bookings",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: AppColors.Colorq.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(dimension.height7)),
              ),
            ),
            SizedBox(height: 8,),
            Expanded(
              child: ListView.builder(
                itemCount: accountList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Bounce(
                      duration: Duration(milliseconds: 200),
                      onPressed: () {
                        Get.to( accountList[index]["page"]);


                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 50,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                accountList[index]["icon"],
                                color: AppColors.Colorq,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                accountList[index]["title"],
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: dimension.height18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.Colorq.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.circular(dimension.height7)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    auth.signOut().then((value) {
                      Get.off(Login());
                    }).onError((error, stackTrace) {
                      Utils().tostmessage(error.toString());
                    });
                  },
                  child: Container(
                    height: dimension.height40,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(dimension.height7),
                        border: Border.all(color: AppColors.Colorq)),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: dimension.height35,
            )
          ],
        ),
      ),
    );
  }
}
