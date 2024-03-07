import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_serve/src/location/googleLocation.dart';
import 'package:city_serve/src/page/category.dart';
import 'package:city_serve/src/page/search.dart';
import 'package:city_serve/src/page/serviceDescription.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:city_serve/widget/serviceContainer.dart';
import 'package:city_serve/widget/serviceContainer2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
CarouselController sliderOne = CarouselController();

class _DashboardState extends State<Dashboard> {
  String c1 = "";
  var cnameValue;

  @override
  void initState() {
    // TODO: implement initState
    // getDataFromFirestore();
    getDataFromFirestore("abcd");

    super.initState();
  }

  final CollectionReference refC =
      FirebaseFirestore.instance.collection('category');
  int sliderIndex = 0;
  var fieldData;

  getDataFromFirestore(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('category')
          .doc(documentId)
          .get();

      var data = documentSnapshot["cname"];

      cnameValue = data;
      print("data :${cnameValue}");
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String categoryName;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(fieldData["cname"]),

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
                            sliderIndex = index;
                            print(index);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DotsIndicator(
                        dotsCount: 5,
                        position: sliderIndex,
                        decorator: DotsDecorator(
                          activeColor: AppColors.Colorq,
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Bounce(
                              duration: Duration(milliseconds: 200),
                              onPressed: () {
                                Get.to(GoogleLocation());
                              },
                              child: Container(
                                height: dimension.height43,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    border: Border.all(color: AppColors.Colorq),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: AppColors.Colorq,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 250,
                                        child: Text(
                                          currentLocation,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontSize: dimension.height16,
                                              color:
                                                  AppColors.Colorq.withOpacity(
                                                      0.8)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: dimension.width10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Bounce(
                              duration: Duration(milliseconds: 200),
                              onPressed: () {
                                Get.to(SearchPage());
                              },
                              child: Container(
                                height: dimension.height43,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(
                                        dimension.height7),
                                    border:
                                        Border.all(color: AppColors.Colorq)),
                                child: Icon(
                                  Icons.search,
                                  color: AppColors.Colorq,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: dimension.height10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height20,
                              fontWeight: FontWeight.w400),
                        ),
                        Bounce(
                          duration: Duration(milliseconds: 200),
                          onPressed: () {
                            Get.to(Categoryy());
                          },
                          child: Container(
                            child: Text(
                              "See all",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ]),
                  Container(
                    height: dimension.height100 * 2,

                    // color: AppColors.red,
                    child: StreamBuilder(
                      stream: refC.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2,
                                    crossAxisSpacing: 7),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              return Padding(
                                padding:
                                    EdgeInsets.only(bottom: dimension.height8),
                                child: Bounce(
                                  duration: Duration(milliseconds: 200),
                                  onPressed: () {
                                    categoryName = documentSnapshot.id;

                                    Get.bottomSheet(
                                        isDismissible: true,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Bounce(
                                                duration:
                                                    Duration(milliseconds: 200),
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppColors.Colorq,
                                                    ),
                                                    child: Icon(Icons.cancel,
                                                        color: AppColors.white1,
                                                        size: 30)),
                                              ),
                                            ),
                                            Container(
                                              height:
                                                  dimension.height100 * 2.99,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      documentSnapshot['cname']
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: AppColors
                                                                  .Colorq,
                                                              fontSize:
                                                                  dimension
                                                                      .height20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 246,
                                                    child: StreamBuilder(
                                                      stream: FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              'category')
                                                          .doc(categoryName)
                                                          .collection(
                                                              "subcategories")
                                                          .snapshots(),
                                                      builder: (context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              streamSnapshot) {
                                                        if (streamSnapshot
                                                            .hasData) {
                                                          return GridView
                                                              .builder(
                                                            itemCount:
                                                                streamSnapshot
                                                                    .data!
                                                                    .docs
                                                                    .length,
                                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    3,
                                                                childAspectRatio:
                                                                    0.92
                                                                // Number of columns
                                                                ),
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              final DocumentSnapshot
                                                                  documentSnapshot =
                                                                  streamSnapshot
                                                                          .data!
                                                                          .docs[
                                                                      index];
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Bounce(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          200),
                                                                  onPressed:
                                                                      () {
                                                                    // if (index == 0) {
                                                                    //   mMassage = true;
                                                                    //   mSalon = false;
                                                                    // }
                                                                    // if (index == 1) {
                                                                    //   mSalon = true;
                                                                    //   mMassage = false;
                                                                    // }
                                                                    //
                                                                    // Get.back();
                                                                    // Get.to(ForMen());
                                                                  },
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                          height:
                                                                              70,
                                                                          width:
                                                                              70,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(dimension.height7),
                                                                            image:
                                                                                DecorationImage(image: NetworkImage(documentSnapshot['scimage'].toString()), fit: BoxFit.cover),
                                                                          )),
                                                                      Container(
                                                                        height:
                                                                            dimension.height45,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: 10),
                                                                          child:
                                                                              Text(
                                                                            documentSnapshot['scname'].toString(),
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style: GoogleFonts.poppins(
                                                                                color: AppColors.Colorq,
                                                                                fontSize: dimension.height14,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            shrinkWrap: true,
                                                          );
                                                        }

                                                        return const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                  // GridView.builder(
                                                  //   physics:
                                                  //   NeverScrollableScrollPhysics(),
                                                  //   gridDelegate:
                                                  //   SliverGridDelegateWithFixedCrossAxisCount(
                                                  //       crossAxisCount: 3,
                                                  //       childAspectRatio: 1.7),
                                                  //   itemCount: 2,
                                                  //   itemBuilder: (context, index) {
                                                  //     return Padding(
                                                  //       padding:
                                                  //       const EdgeInsets.all(
                                                  //           8.0),
                                                  //       child: Bounce(
                                                  //         duration: Duration(
                                                  //             milliseconds: 200),
                                                  //         onPressed: () {
                                                  //           // if (index == 0) {
                                                  //           //   mMassage = true;
                                                  //           //   mSalon = false;
                                                  //           // }
                                                  //           // if (index == 1) {
                                                  //           //   mSalon = true;
                                                  //           //   mMassage = false;
                                                  //           // }
                                                  //           //
                                                  //           // Get.back();
                                                  //           // Get.to(ForMen());
                                                  //         },
                                                  //         child: Container(
                                                  //           // height: 40,
                                                  //           // width: 80,
                                                  //           decoration: BoxDecoration(
                                                  //               color: AppColors
                                                  //                   .Colorq
                                                  //                   .withOpacity(
                                                  //                   0.5),
                                                  //               borderRadius:
                                                  //               BorderRadius
                                                  //                   .circular(
                                                  //                   7)),
                                                  //         ),
                                                  //       ),
                                                  //     );
                                                  //   },
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                  child: Animate(
                                    effects: [ShimmerEffect()],
                                    child: Container(
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color:
                                              AppColors.Colorq.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Container(
                                        height: 75,
                                        decoration: BoxDecoration(
                                            color: AppColors.Colorq.withOpacity(
                                                0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                  height: 70,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            dimension.height7),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            documentSnapshot[
                                                                    'cimage']
                                                                .toString()),
                                                        fit: BoxFit.cover),
                                                  )),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Container(
                                                width: 90,
                                                child: Text(
                                                  documentSnapshot['cname'],
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        return Center(
                          child: Container(
                              width: 100,
                              child: Lottie.asset(
                                  "assets/lottie/cityServeLoading.json")),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most booked service",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height22,
                            fontWeight: FontWeight.w400),
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
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
                      itemCount: allServices.length,
                      itemBuilder: (context, index) {
                        if (allServices[index]["category"] ==
                            "mostBookedservice") {
                          return Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.to(ServiceDescription(serviceId: 'abc',));
                            },
                            child: ServiceContainer(
                              image: allServices[index]["image"],
                              srvName: allServices[index]["name"],
                              srvRating: allServices[index]["rating"],
                              srvPrice: allServices[index]["price"],
                            ),
                          );
                        } else {
                          return SizedBox();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New & Noteworthy",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height22,
                            fontWeight: FontWeight.w400),
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cleaning & Pest Control",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height22,
                            fontWeight: FontWeight.w400),
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
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
                                  width: 150,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quick home repairs",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height22,
                            fontWeight: FontWeight.w400),
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
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
                      itemCount: allServices.length,
                      itemBuilder: (context, index) {
                        if (allServices[index]["category"] ==
                            "quickHomeRepairs") {
                          return ServiceContainer(
                            image: allServices[index]["image"],
                            srvName: allServices[index]["name"],
                            srvRating: allServices[index]["rating"],
                            srvPrice: allServices[index]["price"],
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ac & Appliance Repair",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height22,
                            fontWeight: FontWeight.w400),
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height55,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allServices.length,
                        itemBuilder: (context, index) {
                          if (allServices[index]["category"] ==
                              "acApplianceRepair") {
                            return ServiceContainer2(
                                srvName: allServices[index]["name"],
                                srvImage: allServices[index]["image"]);
                          } else {
                            return SizedBox();
                          }
                        }),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Massage for Men",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height22,
                            fontWeight: FontWeight.w400),
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allServices.length,
                      itemBuilder: (context, index) {
                        if (allServices[index]["category"] == "massageMen") {
                          return ServiceContainer2(
                              srvName: allServices[index]["name"],
                              srvImage: allServices[index]["image"]);
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spa for Women",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height22,
                            fontWeight: FontWeight.w400),
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allServices.length,
                      itemBuilder: (context, index) {
                        if (allServices[index]["category"] == "spaWomen") {
                          return ServiceContainer2(
                              srvName: allServices[index]["name"],
                              srvImage: allServices[index]["image"]);
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Salon for Women",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height22,
                            fontWeight: FontWeight.w400),
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allServices.length,
                      itemBuilder: (context, index) {
                        if (allServices[index]["category"] == "salonWomen") {
                          return ServiceContainer2(
                              srvName: allServices[index]["name"],
                              srvImage: allServices[index]["image"]);
                        } else {
                          return SizedBox();
                        }
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
// Row(
//   children: [
//     Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(right: 5, bottom: 5),
//         child: Bounce(
//           duration: Duration(milliseconds: 200),
//           onPressed: () {
//             Get.bottomSheet(
//                 isDismissible: true,
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Bounce(
//                         duration: Duration(milliseconds: 200),
//                         onPressed: () {
//                           Get.back();
//                         },
//                         child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: AppColors.Colorq,
//                             ),
//                             child: Icon(Icons.cancel,
//                                 color: AppColors.white1,
//                                 size: 30)),
//                       ),
//                     ),
//                     Container(
//                       height: 291,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10))),
//                       child: Column(
//                         crossAxisAlignment:
//                             CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding:
//                                 const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Salon for Men",
//                               style: GoogleFonts.poppins(
//                                   color: AppColors.Colorq,
//                                   fontSize: 20,
//                                   fontWeight:
//                                       FontWeight.w400),
//                             ),
//                           ),
//                           Container(
//                             height: 245,
//                             child: GridView.builder(
//                               physics:
//                                   NeverScrollableScrollPhysics(),
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 3,
//                                       childAspectRatio: 1.7),
//                               itemCount: 2,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding:
//                                       const EdgeInsets.all(
//                                           8.0),
//                                   child: Bounce(
//                                     duration: Duration(
//                                         milliseconds: 200),
//                                     onPressed: () {
//                                       if (index == 0) {
//                                         mMassage = true;
//                                         mSalon = false;
//                                       }
//                                       if (index == 1) {
//                                         mSalon = true;
//                                         mMassage = false;
//                                       }
//
//                                       Get.back();
//                                       Get.to(ForMen());
//                                     },
//                                     child: Container(
//                                       // height: 40,
//                                       // width: 80,
//                                       decoration: BoxDecoration(
//                                           color: AppColors
//                                                   .Colorq
//                                               .withOpacity(
//                                                   0.5),
//                                           borderRadius:
//                                               BorderRadius
//                                                   .circular(
//                                                       7)),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ));
//           },
//           child: Container(
//             height: 75,
//             decoration: BoxDecoration(
//               color: AppColors.Colorq.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(7),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15),
//                     child: cnameValue == null
//                         ? SizedBox()
//                         : Text(
//                       cnameValue,
//                             style: GoogleFonts.poppins(
//                                 fontSize: 16),
//                           ),
//                   ),
//                   Spacer(),
//                   Image(
//                       image: AssetImage(
//                           "assets/category/category_man.jpg"))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//     Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 5, bottom: 5),
//         child: Bounce(
//           duration: Duration(milliseconds: 200),
//           onPressed: () {
//             Get.bottomSheet(
//                 isDismissible: true,
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Bounce(
//                         duration: Duration(milliseconds: 200),
//                         onPressed: () {
//                           Get.back();
//                         },
//                         child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: AppColors.Colorq,
//                             ),
//                             child: Icon(Icons.cancel,
//                                 color: AppColors.white1,
//                                 size: 30)),
//                       ),
//                     ),
//                     Container(
//                       height: 291,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10))),
//                       child: Column(
//                         crossAxisAlignment:
//                             CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding:
//                                 const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Salon for Women",
//                               style: GoogleFonts.poppins(
//                                   color: AppColors.Colorq,
//                                   fontSize: 20,
//                                   fontWeight:
//                                       FontWeight.w400),
//                             ),
//                           ),
//                           Container(
//                             height: 245,
//                             child: GridView.builder(
//                               physics:
//                                   NeverScrollableScrollPhysics(),
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 3,
//                                       childAspectRatio: 1.7),
//                               itemCount: 3,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding:
//                                       const EdgeInsets.all(
//                                           8.0),
//                                   child: Bounce(
//                                     duration: Duration(
//                                         milliseconds: 200),
//                                     onPressed: () {
//                                       if (index == 0) {
//                                         wSpa = true;
//                                         wSalon = false;
//                                         wStudio = false;
//                                       }
//                                       if (index == 1) {
//                                         wSpa = false;
//                                         wSalon = true;
//                                         wStudio = false;
//                                       }
//                                       if (index == 2) {
//                                         wSpa = false;
//                                         wSalon = false;
//                                         wStudio = true;
//                                       }
//                                       Get.back();
//                                       Get.to(ForWomen());
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           color: AppColors
//                                                   .Colorq
//                                               .withOpacity(
//                                                   0.5),
//                                           borderRadius:
//                                               BorderRadius
//                                                   .circular(
//                                                       7)),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ));
//           },
//           child: Container(
//             height: 75,
//             decoration: BoxDecoration(
//                 color: AppColors.Colorq.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(7)),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Image(
//                       image: AssetImage(
//                           "assets/category/category_women.jpg")),
//                   Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: Text(
//                       "Spa for\nWomen",
//                       style:
//                           GoogleFonts.poppins(fontSize: 16),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
// Row(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(
//             right: 5, bottom: 5, top: 5),
//         child: Bounce(
//           duration: Duration(milliseconds: 200),
//           onPressed: () {
//             Get.bottomSheet(
//                 isDismissible: true,
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Bounce(
//                         duration: Duration(milliseconds: 200),
//                         onPressed: () {
//                           Get.back();
//                         },
//                         child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: AppColors.Colorq,
//                             ),
//                             child: Icon(Icons.cancel,
//                                 color: AppColors.white1,
//                                 size: 30)),
//                       ),
//                     ),
//                     Container(
//                       height: 291,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10))),
//                       child: Column(
//                         crossAxisAlignment:
//                             CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding:
//                                 const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Cleaning",
//                               style: GoogleFonts.poppins(
//                                   color: AppColors.Colorq,
//                                   fontSize: 20,
//                                   fontWeight:
//                                       FontWeight.w400),
//                             ),
//                           ),
//                           Container(
//                             height: 245,
//                             child: GridView.builder(
//                               physics:
//                                   NeverScrollableScrollPhysics(),
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 3,
//                                       childAspectRatio: 1.7),
//                               itemCount: 8,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding:
//                                       const EdgeInsets.all(
//                                           8.0),
//                                   child: Container(
//                                     // height: 40,
//                                     // width: 80,
//                                     decoration: BoxDecoration(
//                                         color: AppColors
//                                                 .Colorq
//                                             .withOpacity(0.5),
//                                         borderRadius:
//                                             BorderRadius
//                                                 .circular(7)),
//                                   ),
//                                 );
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ));
//           },
//           child: Column(
//             children: [
//               Container(
//                 height: 75,
//                 width: double.maxFinite,
//                 child: Image(
//                     image: AssetImage(
//                         "assets/category/category_plumber.jpg")),
//                 decoration: BoxDecoration(
//                     color: AppColors.Colorq.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(7)),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 "Cleaning",
//                 style: GoogleFonts.poppins(
//                     color: AppColors.Colorq,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//     Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(
//             left: 5, bottom: 5, right: 5, top: 5),
//         child: Bounce(
//           duration: Duration(milliseconds: 200),
//           onPressed: () {
//             Get.bottomSheet(
//                 isDismissible: true,
//                 Container(
//                   height: 285,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10))),
//                   child: Column(
//                     crossAxisAlignment:
//                         CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "Electrician, Plumber & Carpenters",
//                           style: GoogleFonts.poppins(
//                               color: AppColors.Colorq,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w300),
//                         ),
//                       ),
//                       Container(
//                         height: 245,
//                         child: GridView.builder(
//                           physics:
//                               NeverScrollableScrollPhysics(),
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 3,
//                                   childAspectRatio: 1.7),
//                           itemCount: 8,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding:
//                                   const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     // height: 40,
//                                     // width: 80,
//                                     decoration: BoxDecoration(
//                                         color: AppColors
//                                                 .Colorq
//                                             .withOpacity(0.5),
//                                         borderRadius:
//                                             BorderRadius
//                                                 .circular(7)),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                 ));
//           },
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 height: 75,
//                 width: double.maxFinite,
//                 decoration: BoxDecoration(
//                     color: AppColors.Colorq.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(7)),
//                 child: Image(
//                   image: AssetImage(
//                       "assets/category/category_acc1.png"),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 "Appliance\n    Repair",
//                 style: GoogleFonts.poppins(
//                     color: AppColors.Colorq,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//     Expanded(
//       child: Padding(
//         padding:
//             const EdgeInsets.only(left: 5, bottom: 5, top: 5),
//         child: Bounce(
//           duration: Duration(milliseconds: 200),
//           onPressed: () {
//             Get.to(Categoryy());
//           },
//           child: Column(
//             children: [
//               Container(
//                 height: 75,
//                 width: double.maxFinite,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Center(
//                     child: Text(
//                       "View all",
//                       style: GoogleFonts.poppins(
//                           decoration:
//                               TextDecoration.underline,
//                           color: AppColors.Colorq,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     // color: AppColors.Colorq.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(7)),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
