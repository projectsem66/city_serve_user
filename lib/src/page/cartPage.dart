import 'package:city_serve/demo.dart';
import 'package:city_serve/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../btm_controller.dart';
import '../../utils/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}
BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;

class _CartPageState extends State<CartPage> {
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
        title: Text("Cart"),
      ),
      body:Column(
        children: [
          booking(),
        ],
      ),
    );
  }
}
