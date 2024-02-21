import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Cart"),
      ),
    );
  }
}
