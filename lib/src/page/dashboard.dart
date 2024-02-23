import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_serve/src/page/search.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../btm_controller.dart';
import '../../servicesList/allServices.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

List sliderImages = [
  "assets/dashboard/slider1.jpg",
  "assets/dashboard/slider2.jpg",
  "assets/dashboard/slider3.jpg",
  "assets/dashboard/slider5.jpg",
  "assets/dashboard/slider7.jpg"
];
List Slider2Images = [
  "assets/dashboard/2ndSlider/2ndSlider3.jpg",
  "assets/dashboard/2ndSlider/2ndSlider2.jpeg",
  "assets/dashboard/2ndSlider/2ndSlider4.jpg",
  "assets/dashboard/2ndSlider/2ndSlider1.jpg",
  "assets/dashboard/2ndSlider/2ndSlider5.jpg",
  "assets/dashboard/2ndSlider/2ndSlider6.jpg",
];
List newAndNoteworthy = [
  {
    "name": "Bathroom & Kitchen Cleaning",
    "image": "assets/dashboard/new&noteworthy/newNdNoteworthy.jpg",
    "category": "newAndNoteworthy"
  },
  {
    "name": "Hair Studio for Women",
    "image": "assets/dashboard/new&noteworthy/newNdNoteworthy2.jpg",
    "category": "newAndNoteworthy"
  },
  {
    "name": "Ac Service and Repair",
    "image": "assets/dashboard/new&noteworthy/newNdNoteworthy3.jpg",
    "category": "newAndNoteworthy"
  },
];
List massageMen = [
  {
    "name": "Stress Relief",
    "image": "assets/dashboard/massageMen/man1.jpg",
    "category": "massageMen"
  },
  {
    "name": "Pain Relief",
    "image": "assets/dashboard/massageMen/man2.jpg",
    "category": "massageMen"
  },
];
List spaWomen = [
  {
    "name": "Stress Relief Therapy",
    "image": "assets/dashboard/spaWomen/women1.jpg",
    "category": "spaWomen"
  },
  {
    "name": "Pain Relief Therapy",
    "image": "assets/dashboard/spaWomen/women2.jpg",
    "category": "spaWomen"
  },
  {
    "name": "Postback Workout",
    "image": "assets/dashboard/spaWomen/women3.jpg",
    "category": "spaWomen"
  },
];
List salonWomen = [
  {
    "name": "Waxing",
    "image": "assets/dashboard/spaWomen/women4.jpg",
    "category": "salonWomen"
  },
  {
    "name": "Facial & Cleanup",
    "image": "assets/dashboard/spaWomen/women5.jpg",
    "category": "salonWomen"
  },
  {
    "name": "Manicure",
    "image": "assets/dashboard/spaWomen/women6.jpg",
    "category": "salonWomen"
  },
  {
    "name": "Pedicure",
    "image": "assets/dashboard/spaWomen/women7.jpg",
    "category": "salonWomen"
  },
  {
    "name": "Threading & Face wax",
    "image": "assets/dashboard/spaWomen/women8.jpg",
    "category": "salonWomen"
  },
  {
    "name": "Bleach & Detan",
    "image": "assets/dashboard/spaWomen/women9.jpg",
    "category": "salonWomen"
  },
  {
    "name": "Haircare",
    "image": "assets/dashboard/spaWomen/women10.jpg",
    "category": "salonWomen"
  },
];

List pestControl = [
  {
    "name": "Bathroom & Kitchen Cleaning",
    "image": "assets/dashboard/pestControl/1x.jpg",
    "category": "pestControl"
  },
  {
    "name": "Sofa & Carpet Cleaning",
    "image": "assets/dashboard/pestControl/2x.jpg",
    "category": "pestControl"
  },
];
List acApplianceRepair = [
  {
    "name": "Ac Service & Repair",
    "image": "assets/dashboard/acApplianceRepair/1y.jpg",
    "category": "acApplianceRepair"
  },
  {
    "name": "Washing Machine Repair",
    "image": "assets/dashboard/acApplianceRepair/2y.jpg",
    "category": "acApplianceRepair"
  },
  {
    "name": "Water Purifier Repair",
    "image": "assets/dashboard/acApplianceRepair/3y.jpg",
    "category": "acApplianceRepair"
  },
  {
    "name": "Refrigerator Repair",
    "image": "assets/dashboard/acApplianceRepair/4y.jpg",
    "category": "acApplianceRepair"
  },
  {
    "name": "Microwave Repair",
    "image": "assets/dashboard/acApplianceRepair/5y.jpg",
    "category": "acApplianceRepair"
  },
  {
    "name": "Chimney Repair",
    "image": "assets/dashboard/acApplianceRepair/6y.jpg",
    "category": "acApplianceRepair"
  },
];
List quickHomeRepairs = [
  {
    "name": "Tap Repairs",
    "image": "assets/dashboard/quickHomeRepairs/1z.jpg",
    "rating": "4.88",
    "price": "220",
    "category": "quickHomeRepairs"
  },
  {
    "name": "Washbasin Pipe Leakage",
    "image": "assets/dashboard/quickHomeRepairs/2z.jpg",
    "rating": "4.88",
    "price": "220",
    "category": "quickHomeRepairs"
  },
  {
    "name": "Drill & Hang (Wall Decor) ",
    "image": "assets/dashboard/quickHomeRepairs/3z.jpg",
    "rating": "4.88",
    "price": "220",
    "category": "quickHomeRepairs"
  },
  {
    "name": "Switch / Socket Replacement",
    "image": "assets/dashboard/quickHomeRepairs/4z.jpg",
    "rating": "4.88",
    "price": "220",
    "category": "quickHomeRepairs"
  },
  {
    "name": "Switchboard / Switchbox Repair",
    "image": "assets/dashboard/quickHomeRepairs/5z.jpg",
    "rating": "4.88",
    "price": "220",
    "category": "quickHomeRepairs"
  },
  {
    "name": "Jet Spray",
    "image": "assets/dashboard/quickHomeRepairs/6z.jpg",
    "rating": "4.88",
    "price": "220",
    "category": "quickHomeRepairs"
  },
  {
    "name": "Drawer Channel Repair",
    "image": "assets/dashboard/quickHomeRepairs/7z.jpg",
    "rating": "4.88",
    "price": "220",
    "category": "quickHomeRepairs"
  },
];

BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;
// List mostBook = [
//   {
//     "name": "Cleaning",
//     "image": "assets/dashboard/mostBook/1u.jpg",
//     "rating": "4.88",
//     "price": "220"
//   },
//   {
//     "name": "Cleaning",
//     "image": "assets/dashboard/mostBook/2u.jpg",
//     "rating": "4.88",
//     "price": "220"
//   },
//   {
//     "name": "Cleaning",
//     "image": "assets/dashboard/mostBook/3u.jpg",
//     "rating": "4.88",
//     "price": "220"
//   },
//   {
//     "name": "Cleaning",
//     "image": "assets/dashboard/mostBook/4u.jpg",
//     "rating": "4.88",
//     "price": "220"
//   },
//   {
//     "name": "Cleaning",
//     "image": "assets/dashboard/mostBook/5u.jpg",
//     "rating": "4.88",
//     "price": "220"
//   },
//   {
//     "name": "Cleaning",
//     "image": "assets/dashboard/mostBook/6u.jpg",
//     "rating": "4.88",
//     "price": "220"
//   },
//   {
//     "name": "Cleaning",
//     "image": "assets/dashboard/mostBook/7u.jpg",
//     "rating": "4.88",
//     "price": "220"
//   },
//   {
//     "name": "Cleaning",
//     "image": "assets/dashboard/mostBook/8u.jpg",
//     "rating": "4.88",
//     "price": "220"
//   },
// ];

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: dimension.height100 +
                      dimension.height100 +
                      dimension.height75,
                  child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: CarouselSlider.builder(
                      carouselController: CarouselController(),
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(sliderImages[index]),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeFactor: 0,
                        scrollDirection: Axis.horizontal,
                        autoPlayInterval: Duration(seconds: 8),
                        autoPlayCurve: Curves.ease,
                        enableInfiniteScroll: true,
                        height: dimension.height100 * 2.5,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        autoPlayAnimationDuration: const Duration(seconds: 4),
                        animateToClosest: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            // _currentIndex = index;
                            print(index);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(7)),
                    child: TextFormField(
                      onTap: () {
                        Get.to(SearchPage());
                      },
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: AppColors.Colorq),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Search here..",
                        hintStyle: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                        contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.Colorq),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.Colorq.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: dimension.height15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5, bottom: 5),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              setState(() {
                                _currentIndex1 = 2;
                                _.currentIndex = 2;
                                _.update();
                                print(_currentIndex1);
                              });
                            },
                            child: Container(
                              height: 75,
                              decoration: BoxDecoration(
                                color: AppColors.Colorq.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Spa for \n men",
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                    ),
                                    Spacer(),
                                    Image(
                                        image: AssetImage(
                                            "assets/category/category_man.jpg"))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 5),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {},
                            child: Container(
                              height: 75,
                              decoration: BoxDecoration(
                                  color: AppColors.Colorq.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/category/category_women.jpg")),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Text(
                                        "Spa for\nWomen",
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 5, bottom: 5, top: 5),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.bottomSheet(
                                  isDismissible: true,
                                  Container(
                                    height: 285,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Electrician, Plumber & Carpenters",
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        Container(
                                          height: 245,
                                          child: GridView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    childAspectRatio: 1.7),
                                            itemCount: 8,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  // height: 40,
                                                  // width: 80,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.Colorq
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 75,
                                  width: double.maxFinite,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/category/category_plumber.jpg")),
                                  decoration: BoxDecoration(
                                      color: AppColors.Colorq.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Cleaning",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, bottom: 5, right: 5, top: 5),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.bottomSheet(
                                  isDismissible: true,
                                  Container(
                                    height: 285,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Electrician, Plumber & Carpenters",
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        Container(
                                          height: 245,
                                          child: GridView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    childAspectRatio: 1.7),
                                            itemCount: 8,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      // height: 40,
                                                      // width: 80,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                                  .Colorq
                                                              .withOpacity(0.5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7)),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 75,
                                  width: double.maxFinite,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/category/category_acc1.png")),
                                  decoration: BoxDecoration(
                                      color: AppColors.Colorq.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Appliance\n    Repair",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.bottomSheet(
                                isDismissible: true,
                                Container(
                                  height: 285,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Electrician, Plumber & Carpenters",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      Container(
                                        height: 245,
                                        child: GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 1.7),
                                          itemCount: 8,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.Colorq
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 75,
                                  width: double.maxFinite,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/category/category_drill.png")),
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppColors.Colorq.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Plumber",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Text(
                    "Most booked service",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 +
                        dimension.height100 +
                        dimension.height55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        if (mostBook[index]["category"] ==
                            "mostBookedservice") {
                          return Container(
                            // height: 300,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: dimension.width12),
                              child: Column(
                                children: [
                                  Container(
                                    height: dimension.height100 +
                                        dimension.height40,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        color:
                                            AppColors.Colorq.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(7),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                mostBook[index]["image"]),
                                            fit: BoxFit.cover)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          mostBook[index]['name'],
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontSize: dimension.height15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "★ ${mostBook[index]['rating']}",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontSize: dimension.height13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "₹ ${mostBook[index]['price']}",
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
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  CarouselSlider.builder(
                    carouselController: CarouselController(),
                    itemCount: 6,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Slider2Images[index]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(7)),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeFactor: 0.2,
                      scrollDirection: Axis.horizontal,
                      autoPlayInterval: Duration(seconds: 8),
                      autoPlayCurve: Curves.ease,
                      enableInfiniteScroll: true,
                      height: dimension.height100 * 2,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration: const Duration(seconds: 4),
                      animateToClosest: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          // _currentIndex = index;
                          print(index);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Text(
                    "New & Noteworthy",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newAndNoteworthy.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 300,
                          child: Padding(
                            padding: EdgeInsets.only(right: dimension.width12),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      dimension.height100 + dimension.height40,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: AppColors.Colorq.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(7),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              newAndNoteworthy[index]["image"]),
                                          fit: BoxFit.cover)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newAndNoteworthy[index]['name'],
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.height15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Text(
                    "Cleaning & Pest Control",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height52,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pestControl.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 300,
                          child: Padding(
                            padding: EdgeInsets.only(right: dimension.width12),
                            child: Column(
                              children: [
                                Container(
                                  width: 140,
                                  child: Text(
                                    newAndNoteworthy[index]['name'],
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
                                          image: AssetImage(
                                              pestControl[index]["image"]),
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
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Text(
                    "Quick home repairs",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 +
                        dimension.height100 +
                        dimension.height32,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: quickHomeRepairs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 300,
                          child: Padding(
                            padding: EdgeInsets.only(right: dimension.width12),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      dimension.height100 + dimension.height40,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: AppColors.Colorq.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(7),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              quickHomeRepairs[index]["image"]),
                                          fit: BoxFit.cover)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        quickHomeRepairs[index]['name'],
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.height15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "★ ${quickHomeRepairs[index]['rating']}",
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.height13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "₹ ${quickHomeRepairs[index]['price']}",
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
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Text(
                    "Ac & Appliance Repair",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: acApplianceRepair.length,
                      itemBuilder: (context, index) {
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
                                    acApplianceRepair[index]['name'],
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
                                          image: AssetImage(
                                              acApplianceRepair[index]
                                                  ["image"]),
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
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Text(
                    "Massage for Men",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: massageMen.length,
                      itemBuilder: (context, index) {
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
                                    massageMen[index]['name'],
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
                                          image: AssetImage(
                                              massageMen[index]["image"]),
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
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Text(
                    "Spa for Women",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: spaWomen.length,
                      itemBuilder: (context, index) {
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
                                    spaWomen[index]['name'],
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
                                          image: AssetImage(
                                              spaWomen[index]["image"]),
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
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Text(
                    "Salon for Women",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: salonWomen.length,
                      itemBuilder: (context, index) {
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
                                    salonWomen[index]['name'],
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
                                          image: AssetImage(
                                              salonWomen[index]["image"]),
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
                      },
                    ),
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
