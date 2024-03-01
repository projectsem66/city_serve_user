import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  double height;
  FontWeight fontWeight;

  SmallText(
      {super.key,
      this.color = Colors.white,
      required this.text,
      this.size = 0,
      this.height = 1.2,
      this.overflow = TextOverflow.ellipsis,
      this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        // maxLines: 1,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: color,
            fontSize: size == 0 ? dimension.font14 : size,
            fontWeight: fontWeight,
          ),
        ));
  }
}
