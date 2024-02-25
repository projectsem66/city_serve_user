import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: dimension.height5,
        ),
        Text(
          "Spa for Women",
          style: GoogleFonts.poppins(
              color: AppColors.Colorq,
              fontSize: dimension.height25,
              fontWeight: FontWeight.w500),
        ),
        Bounce(
          duration: Duration(milliseconds: 200),
          onPressed: () {
            // _scrollController.animateTo(
            //   _scrollController.offset - 1000,
            //   duration: Duration(milliseconds: 500),
            //   curve: Curves.easeInOut,
            // );
          },
          child: Text(
            "★  4.83",
            style: GoogleFonts.poppins(
                color: AppColors.Colorq,
                fontSize: dimension.height16,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: 230,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  color: AppColors.Colorq,
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}
