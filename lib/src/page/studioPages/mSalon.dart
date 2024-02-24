import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class MSalon extends StatefulWidget {
  const MSalon({super.key});

  @override
  State<MSalon> createState() => _MSalonState();
}

class _MSalonState extends State<MSalon> {
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
