import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceDescription extends StatefulWidget {
  const ServiceDescription({super.key});

  @override
  State<ServiceDescription> createState() => _ServiceDescriptionState();
}

class _ServiceDescriptionState extends State<ServiceDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenwidth() + dimension.height100 * 0.75,
                  child: Stack(
                    children: [
                      Container(
                        height: screenwidth(),
                        width: screenwidth(),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/1j.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Container(
                          height: dimension.height100 * 1.69,
                          width: dimension.height100 * 3.5,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(dimension.height7),
                            border: Border.all(color: AppColors.Colorq),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "AC Maintenance and Cleaning",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: dimension.height15,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: dimension.height5,
                                ),
                                Text(
                                  "AC installation",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.height18,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: dimension.height4,
                                ),
                                Text(
                                  "₹500",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.height16,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: dimension.height4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Duration",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Colors.black54,
                                          fontSize: dimension.height16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "50 min",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.height16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Ratings",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Colors.black54,
                                          fontSize: dimension.height16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.star_outlined,
                                      size: dimension.height16,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "4.5",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.height16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: dimension.height10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "cndscidshcndfohcdwocjdrifvherodsljiocfhdefpdwsdkibefifhdewsdlmdwfheodjqwldbrdmfhwldnd bf,mhqwdlqswnhd,kfbgewlowjdofgdefkdbswkdhzswidghewdnsqldjodhkifbskdjqlwdoheifbgdjdbsljwideujvgbdebslodhnweifejfbvwdqohdwedgdifcvdecivswbdswopidjqwdoehiiebcfewska,malwsjewoihf",
                        style: GoogleFonts.poppins(
                            color: Colors.black54,
                            fontSize: dimension.height16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: dimension.height15,
                      ),
                      Text(
                        "About Provider",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: dimension.height10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimension.height7),
                          color: AppColors.Colorq.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: dimension.height70,
                                    width: dimension.height70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.Colorq),
                                  ),
                                  SizedBox(
                                    width: dimension.height15,
                                  ),
                                  Container(
                                    width: dimension.height100 * 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Felix Harris",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontSize: dimension.height20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Bounce(
                duration: Duration(milliseconds: 200),
                onPressed: () {},
                child: Container(
                  height: dimension.height50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.Colorq,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(dimension.height7)),
                  child: Center(
                    child: Text(
                      "Book now",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: dimension.height18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
