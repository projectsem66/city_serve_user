import 'package:city_serve/src/login.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';

import '../../btm_controller.dart';
import '../../login/login_Screen.dart';
import '../../login/util.dart';
import '../../utils/colors.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;

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
      body: Column(
        children: [
          Bounce(
            duration: Duration(milliseconds: 200),
            onPressed: () {
              auth.signOut().then((value){
                Navigator.
                push
                  (context, MaterialPageRoute(builder: (context) => Login()));
              }).onError((error, stackTrace){
                Utils().tostmessage(error.toString());
              });
            },

            child: Container(
              height: dimension.height43,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(
                      dimension.height7),
                  border:
                  Border.all(color: AppColors.Colorq)),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Logout"),
              )
            ),
          ),
        ],
      ),
    );
  }
}
