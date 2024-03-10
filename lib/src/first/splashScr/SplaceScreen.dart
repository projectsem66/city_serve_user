import 'package:city_serve/src/first/splashScr/splashServices.dart';
import 'package:flutter/material.dart';

import '../../../utils/dimension.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  splashServices splashScreen = splashServices();

  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
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
      ),
    );
  }
}
