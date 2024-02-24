
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class WSalon extends StatefulWidget {
  const WSalon({super.key});

  @override
  State<WSalon> createState() => _WSalonState();
}

class _WSalonState extends State<WSalon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Salon",
          style: GoogleFonts.poppins(
              color: AppColors.Colorq,
              fontSize: dimension.height22,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
