import 'dart:async';

import 'package:city_serve/src/first/one.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Get.offAll(() => OnePage(),
            transition: Transition.fade,
            duration: Duration(milliseconds: 300)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: screenheight(),
          width: screenwidth(),
          child: Container(
            height: dimension.height30,
            width: dimension.height30,
            child: Image(
              image: AssetImage("assets/logo/CityServeTextAnim.gif"),
            ),
          ),
        ));
  }
}
