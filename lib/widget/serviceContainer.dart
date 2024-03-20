import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class ServiceContainer extends StatelessWidget {
  String image;
  String srvName;
  String srvRating;
  String srvPrice;

  ServiceContainer(
      {required this.image,
      required this.srvName,
      required this.srvRating,
      required this.srvPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      child: Padding(
        padding: EdgeInsets.only(right: dimension.width12),
        child: Column(
          children: [
            Container(
              height: dimension.height100 + dimension.height40,
              width: 140,
              decoration: BoxDecoration(
                  color: AppColors.Colorq.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover)),
              // child: Image(
              //   image: AssetImage(mostBook[index]["image"]),
              //   fit: BoxFit.cover,
              // ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              // height: dimension.height80,
              width: 140,
              decoration: BoxDecoration(
                // color: AppColors.Colorq.withOpacity(0.5),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    srvName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "★ ${srvRating}",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height13,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "₹ ${srvPrice}",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Text(service["name"]),
// Text("Rating: ${service["rating"]}"),
// Text("Price: ₹${service["price"]}"),
