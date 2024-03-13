import 'dart:io';

import 'package:city_serve/src/page/account/account.dart';
import 'package:city_serve/src/page/bookingPages/booking.dart';
import 'package:city_serve/src/page/bookingPages/bookings.dart';
import 'package:city_serve/src/page/dashboard.dart';
import 'package:city_serve/src/page/favouritePage.dart';
import 'package:city_serve/src/page/studio.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'btm_controller.dart';

class NavigationBarr extends StatefulWidget {
  const NavigationBarr({super.key});

  @override
  State<NavigationBarr> createState() => _NavigationBarrState();
}

class _NavigationBarrState extends State<NavigationBarr> {
  BtmController _ = Get.put(BtmController());
  GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey<ScaffoldState>();
  final btmNaviScr = [
    Dashboard(),
    Bookings(),
    Studio(),
    Booking(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("tapped");

        setState(
              () {
            _.currentIndex != 0
                ? _.currentIndex = 0
                : {
              exit(0),
            };
            // Get.defaultDialog(
            //   // ScaffoldKey.currentState?.openEndDrawer();
            //   buttonColor: AppColors.Colorq,
            //   backgroundColor: Colors.white,
            //   cancelTextColor: AppColors.Colorq,
            //   titleStyle: GoogleFonts.amaranth(
            //       fontSize: 28, color: AppColors.Colorq),
            //   titlePadding: EdgeInsets.all(10),
            //   title: "Exit",
            //   contentPadding: EdgeInsets.all(20),
            //   // middleText: "Are you sure to delete",
            //   content: Column(
            //     children: [
            //       Text(
            //         "Are you sure you want to exit?",
            //         style: GoogleFonts.poppins(
            //             color: AppColors.Colorq,
            //             fontSize: 18,
            //             fontWeight: FontWeight.w500),
            //       ),
            //     ],
            //   ),
            //   textConfirm: "Yes",
            //   textCancel: "Noo",
            //   confirm: TextButton(
            //     onPressed: () async {
            //       exit(0);
            //     },
            //     child: Container(
            //       height: 40,
            //       width: 90,
            //       decoration: BoxDecoration(
            //         // color: AppColors.orange,
            //           border:
            //           Border.all(color: AppColors.Colorq, width: 2),
            //           borderRadius: BorderRadius.circular(10)),
            //       child: Center(
            //         child: Text(
            //           "Yes",
            //           style: GoogleFonts.poppins(
            //               color: AppColors.Colorq,
            //               fontSize: 18,
            //               fontWeight: FontWeight.w500),
            //         ),
            //       ),
            //     ),
            //   ),
            //   cancel: TextButton(
            //       onPressed: () {
            //         Get.back();
            //       },
            //       child: Container(
            //         height: 40,
            //         width: 90,
            //         decoration: BoxDecoration(
            //           color: AppColors.Colorq,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Center(
            //           child: Text(
            //             "Cancel",
            //             style: GoogleFonts.poppins(
            //                 color: Colors.white,
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w500),
            //           ),
            //         ),
            //       )),
            // );
          },
        );
        return false;
      },
      child: Scaffold(
        key: ScaffoldKey,
        body: GetBuilder<BtmController>(builder: (_) {
          return btmNaviScr[_.currentIndex];
        }),
        bottomNavigationBar: GetBuilder<BtmController>(
          builder: (_) {
            return BottomNavigationBar(
              currentIndex: _.currentIndex,
              showSelectedLabels: true,
              selectedIconTheme:
              IconThemeData(color: AppColors.Colorq, shadows: []),
              unselectedIconTheme:
              IconThemeData(color: AppColors.Colorq.withOpacity(0.7)),
              selectedItemColor: AppColors.Colorq,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.event_note,
                  ),
                  label: "Bookings",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.store_mall_directory_outlined,
                  ),
                  label: "Studio",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  label: "Favourite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_outlined,
                  ),
                  label: "Account",
                ),
              ],
              onTap: (index) {
                setState(
                      () {
                    print("navigation page:" + _.currentIndex.toString());
                    _.currentIndex = index;
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
