import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class MSpa extends StatefulWidget {
  const MSpa({super.key});

  @override
  State<MSpa> createState() => _MSpaState();
}

class _MSpaState extends State<MSpa> {
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
