import 'dart:async';

import 'package:city_serve/src/first/one.dart';
import 'package:city_serve/src/location/googleLocation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashServices {
  Future<void> isLogin(BuildContext context) async {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      // userEmail = user!.email ?? '';
      Timer(
        const Duration(seconds: 3),
        () => Get.off(GoogleLocation()),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Get.off(OnePage())
      );
    }
  }
}
