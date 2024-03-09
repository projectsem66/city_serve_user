import 'package:city_serve/navigationBar.dart';
import 'package:city_serve/src/first/splashScr/SplaceScreen.dart';
import 'package:city_serve/src/first/splashScreen.dart';
import 'package:city_serve/src/login.dart';
import 'package:city_serve/src/page/bookings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'login/login_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScr(),
    );
  }
}
