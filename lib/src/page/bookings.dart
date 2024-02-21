import 'package:city_serve/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Column(
        children: [

        ],
      ),
    );
  }
}
