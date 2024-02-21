import 'package:city_serve/src/page/account.dart';
import 'package:city_serve/src/page/bookings.dart';
import 'package:city_serve/src/page/cartPage.dart';
import 'package:city_serve/src/page/dashboard.dart';
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
  int _selectedIndex = 0;
  List<Widget> pages = const [
    Text("CS"),
    Text("CS"),
    Text("CS"),
    Text("CS"),
  ];
  final btmNaviScr = [
    Dashboard(),
    Bookings(),
    Studio(),
    CartPage(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Icons.shopping_cart_outlined,
                ),
                label: "Cart",
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
    );
  }
}
