import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class WStudio extends StatefulWidget {
  const WStudio({super.key});

  @override
  State<WStudio> createState() => _WStudioState();
}

class _WStudioState extends State<WStudio> {
  @override
  Widget build(BuildContext context) {
    return Column(
children: [
  Text(
    "Studio",
    style: GoogleFonts.poppins(
        color: AppColors.Colorq,
        fontSize: dimension.height22,
        fontWeight: FontWeight.w400),
  ),
],
    );
  }
}
