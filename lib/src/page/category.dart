import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Categoryy extends StatefulWidget {
  const Categoryy({super.key});

  @override
  State<Categoryy> createState() => _CategoryyState();
}

class _CategoryyState extends State<Categoryy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Category"),
      ),

    );
  }
}
