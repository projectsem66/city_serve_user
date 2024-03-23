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
              width: dimension.height100*1.3,
              height: dimension.height65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(dimension.height7),topRight: Radius.circular(dimension.height7))

              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  srvName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(


                      color: AppColors.Colorq,
                      fontSize: dimension.height15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),

            Container(
              height: dimension.height100-dimension.height1,
              width: 140,
              decoration: BoxDecoration(
                  // color: AppColors.Colorq.withOpacity(0.5),
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
