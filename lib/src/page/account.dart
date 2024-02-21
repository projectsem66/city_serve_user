import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../btm_controller.dart';
import '../../utils/colors.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;

class _AccountState extends State<Account> {
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
    );
  }
}
