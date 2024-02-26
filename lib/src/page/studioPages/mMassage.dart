import 'package:city_serve/src/page/studioPages/men/massagePages/addOnsPage.dart';
import 'package:city_serve/src/page/studioPages/men/massagePages/painReliefPage.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import 'men/massagePages/postWorkoutPage.dart';
import 'men/massagePages/stressReliefPage.dart';

class MMassage extends StatefulWidget {
  const MMassage({super.key});

  @override
  State<MMassage> createState() => _MMassageState();
}

List mMassage = [
  {
    "srvName": "stress relief",
    "srvImage": "assets/dashboard/studio/massageMen/msgscrl.jpg",
    "page": StressReliefPage(),
  },
  {
    "srvName": "pain relief",
    "srvImage": "assets/dashboard/studio/massageMen/2msgscrl.jpg",
    "page": PainReliefPage(),
  },
  {
    "srvName": "post workout",
    "srvImage": "assets/dashboard/studio/massageMen/3msgscrl.jpg",
    "page": PostWorkoutPage(),
  },
  {
    "srvName": "add ons",
    "srvImage": "assets/dashboard/studio/massageMen/4msgscrl.jpg",
    "page": AddOnsPage(),
  },
];

class _MMassageState extends State<MMassage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: dimension.height5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Massage for Men",
            style: GoogleFonts.poppins(
                color: AppColors.Colorq,
                fontSize: dimension.height25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "★  4.83",
            style: GoogleFonts.poppins(
                color: AppColors.Colorq,
                fontSize: dimension.height16,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: dimension.height10,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.Colorq.withOpacity(0.1),
            borderRadius: BorderRadius.circular(7),
          ),
          height: dimension.height100 * 3 + dimension.height41,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: mMassage.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(dimension.height7),
                child: Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    Get.to(mMassage[index]["page"]);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(dimension.height7),
                            image: DecorationImage(
                                image:
                                    AssetImage(mMassage[index]["srvImage"]))),
                      ),
                      SizedBox(
                        height: dimension.height5,
                      ),
                      Text(
                        mMassage[index]["srvName"],
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
