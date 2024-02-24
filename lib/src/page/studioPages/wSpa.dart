import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class WSpa extends StatefulWidget {
  const WSpa({super.key});

  @override
  State<WSpa> createState() => _WSpaState();
}

class _WSpaState extends State<WSpa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Spa",
          style: GoogleFonts.poppins(
              color: AppColors.Colorq,
              fontSize: dimension.height22,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
