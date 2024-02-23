import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class ServiceContainer2 extends StatelessWidget {
  String srvName;
  String srvImage;

  ServiceContainer2({required this.srvName, required this.srvImage});


  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      child: Padding(
        padding: EdgeInsets.only(right: dimension.width12),
        child: Column(
          children: [
            Container(
              width: 140,
              height: 50,
              child: Text(
                srvName,
                style: GoogleFonts.poppins(
                    color: AppColors.Colorq,
                    fontSize: dimension.height15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: dimension.height100,
              width: 140,
              decoration: BoxDecoration(
                  color: AppColors.Colorq.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: AssetImage(srvImage),
                      fit: BoxFit.fill)),
              // child: Image(
              //   image: AssetImage(mostBook[index]["image"]),
              //   fit: BoxFit.cover,
              // ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
