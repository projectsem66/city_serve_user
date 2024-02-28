import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                // _currentIndex1 = 0;
                // _.currentIndex = 0;
                // _.update();
                // print(_currentIndex1);
              });
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Favourites"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: dimension.height100,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  // color: AppColors.red,
                  borderRadius: BorderRadius.circular(dimension.height7),
                  border: Border.all(color: AppColors.Colorq)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: dimension.height90,
                          width: dimension.height80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(dimension.height7),
                              color: AppColors.Colorq,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/dashboard/mostBook/1u.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Text(
                            " #202",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: dimension.height10,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: dimension.height8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: dimension.height100 * 2.09,
                              height: dimension.height50,
                              child: Text(
                                "Service namewwwwwwwwwwwwSSSwwwwww",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: dimension.height16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Icon(
                              Icons.favorite,
                              color: AppColors.red,
                              size: dimension.height28,
                            ),
                          ],
                        ),
                        Text(
                          "Price: ₹250",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
