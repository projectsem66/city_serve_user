import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_serve/firebaseService/fbRefrences.dart';
import 'package:city_serve/src/location/googleLocation.dart';
import 'package:city_serve/src/page/category.dart';
import 'package:city_serve/src/page/search.dart';
import 'package:city_serve/src/page/serviceDescription.dart';
import 'package:city_serve/src/page/servicesPage.dart';
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
List Slider2service = [
  "186",
  "23",
  "160",
  "224",
  "111",
  "79",
];

List newAndNoteworthySC = [
  {
    "name": "Bathroom & Kitchen Cleaning",
    "image": "assets/dashboard/new&noteworthy/newNdNoteworthy.jpg",
    "category": "Cleaning",
    "subCategory": "Bathroom & Kitchen cleaning",
  },
  {
    "name": "Hair Studio for Women",
    "image": "assets/dashboard/new&noteworthy/newNdNoteworthy2.jpg",
    "category": "Women's Salon & Spa",
    "subCategory": "Hair Studio for Women"
  },
  {
    "name": "Ac Service and Repair",
    "image": "assets/dashboard/new&noteworthy/newNdNoteworthy3.jpg",
    "category": "AC & Appliance Repair",
    "subCategory": "AC Repair & Service"
  },
];

List mostBookServices = ["56","111",  "160", "110", "127", "33", "166", "161"];
List quickHomeRepair2 = ["127", "65", "149", "59", "58"];

List quickHomeRepair = [
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
List cleaningAndPest = [
  {
    "name": "Bathroom & Kitchen Cleaning",
    "image": "assets/dashboard/pestControl/1x.jpg",
    "category": "Cleaning",
    "subCategory": "Bathroom & Kitchen cleaning",
  },
  {
    "name": "Sofa & Carpet Cleaning",
    "image": "assets/dashboard/pestControl/2x.jpg",
    "category": "Cleaning",
    "subCategory": "Sofa & Carpet Cleaning",
  },
];
List acApplianceRepair = [
  {
    "name": "Ac Service & Repair",
    "image": "assets/dashboard/acApplianceRepair/1y.jpg",
    "category": "AC & Appliance Repair",
    "subCategory": "AC Repair & Service"
  },
  {
    "name": "Washing Machine Repair",
    "image": "assets/dashboard/acApplianceRepair/2y.jpg",
    "category": "AC & Appliance Repair",
    "subCategory": "Washing Machine Repair"
  },
  {
    "name": "Water Purifier Repair",
    "image": "assets/dashboard/acApplianceRepair/3y.jpg",
    "category": "AC & Appliance Repair",
    "subCategory": "Water Purifier"
  },
  {
    "name": "Refrigerator Repair",
    "image": "assets/dashboard/acApplianceRepair/4y.jpg",
    "category": "AC & Appliance Repair",
    "subCategory": "Refrigerator Repair"
  },
  {
    "name": "Microwave Repair",
    "image": "assets/dashboard/acApplianceRepair/5y.jpg",
    "category": "AC & Appliance Repair",
    "subCategory": "Microwave Repair"
  },
  {
    "name": "Chimney Repair",
    "image": "assets/dashboard/acApplianceRepair/6y.jpg",
    "category": "AC & Appliance Repair",
    "subCategory": "Chimney Repair"
  },
];
List massageForMen2 = ["168", "166"];
List massageForMen = [
  {
    "name": "Stress Relief",
    "image": "assets/dashboard/massageMen/man1.jpg",
    "category": "Salon Prime for kids & men",
    "subCategory": "Massage for Men",
    "section": "Stress Relief"
  },
  {
    "name": "Pain Relief",
    "image": "assets/dashboard/massageMen/man2.jpg",
    "category": "Salon Prime for kids & men",
    "subCategory": "Massage for Men",
    "section": "Pain Relief"
  }
];
BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;
CarouselController sliderOne = CarouselController();

class _DashboardState extends State<Dashboard> {
  List Slider2service = [
    "186",
    // Rejuvenating Eye Treatment


    "224",
    // bleach
    "160",
    // haircut for men
    "111",
    // intense bathroom cleaning
    "79",
    // fan installation
    "23",
  //   Anti - Rust Deep Clean Ac Service
  ];
  String c1 = "";
  var cnameValue;

  @override
  void initState() {
    // TODO: implement initState
    // getDataFromFirestore();
    getDataFromFirestore("abcd");

    super.initState();
  }

  // final CollectionReference refC =
  //     FirebaseFirestore.instance.collection('category');
  int sliderIndex = 0;
  var fieldData;

  getDataFromFirestore(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await refCategory.doc(documentId).get();

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
                        autoPlay: false,
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
                                Get.to(SearchScreen());
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
                      stream: refCategory.snapshots(),
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
                                            padding: const EdgeInsets.all(8.0),
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
                                            height: dimension.height100 * 2.99,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    documentSnapshot['cname']
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: AppColors.Colorq,
                                                        fontSize:
                                                            dimension.height20,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                Container(
                                                  height: 246,
                                                  child: StreamBuilder(
                                                    stream: refCategory
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
                                                        return GridView.builder(
                                                          itemCount:
                                                              streamSnapshot
                                                                  .data!
                                                                  .docs
                                                                  .length,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      3,
                                                                  childAspectRatio:
                                                                      0.92
                                                                  // Number of columns
                                                                  ),
                                                          itemBuilder:
                                                              (context, index) {
                                                            final DocumentSnapshot
                                                                documentSnapshot =
                                                                streamSnapshot
                                                                        .data!
                                                                        .docs[
                                                                    index];
                                                            return Bounce(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      200),
                                                              onPressed: () {
                                                                subCategoryname =
                                                                    documentSnapshot
                                                                        .id;
                                                                print(
                                                                    subCategoryname);
                                                                print(
                                                                    categoryName);
                                                                Get.back();
                                                                Get.bottomSheet(
                                                                    Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          Bounce(
                                                                        duration:
                                                                            Duration(milliseconds: 200),
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child: Container(
                                                                            decoration: BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                              color: AppColors.Colorq,
                                                                            ),
                                                                            child: Icon(Icons.cancel, color: AppColors.white1, size: 30)),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height: dimension
                                                                              .height100 *
                                                                          2.99,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(10),
                                                                              topRight: Radius.circular(10))),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Text(
                                                                              subCategoryname,
                                                                              style: GoogleFonts.poppins(color: AppColors.Colorq, fontSize: dimension.height20, fontWeight: FontWeight.w400),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            height:
                                                                                dimension.height100 * 2,
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                                                                            child:
                                                                                Container(
                                                                              height: 246,
                                                                              child: StreamBuilder(
                                                                                stream: refCategory.doc(categoryName).collection("subcategories").doc(subCategoryname).collection("sections").snapshots(),
                                                                                builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                                                                                  if (streamSnapshot.hasData) {
                                                                                    return GridView.builder(
                                                                                      itemCount: streamSnapshot.data!.docs.length,
                                                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.92
                                                                                          // Number of columns
                                                                                          ),
                                                                                      itemBuilder: (context, index) {
                                                                                        final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                                                                                        return Bounce(
                                                                                          duration: Duration(milliseconds: 200),
                                                                                          onPressed: () {
                                                                                            sectionName = documentSnapshot.id;
                                                                                            Get.back();
                                                                                            Get.to(ServicesPage());
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: Column(
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Container(
                                                                                                    height: 70,
                                                                                                    width: 70,
                                                                                                    decoration: BoxDecoration(
                                                                                                      borderRadius: BorderRadius.circular(dimension.height7),
                                                                                                      image: DecorationImage(image: NetworkImage(documentSnapshot['simage'].toString()), fit: BoxFit.cover),
                                                                                                    )),
                                                                                                Container(
                                                                                                  height: dimension.height45,
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                                                    child: Center(
                                                                                                      child: Text(
                                                                                                        documentSnapshot['sname'].toString(),
                                                                                                        maxLines: 2,
                                                                                                        overflow: TextOverflow.ellipsis,
                                                                                                        style: GoogleFonts.poppins(color: AppColors.Colorq, fontSize: dimension.height14, fontWeight: FontWeight.w400),
                                                                                                      ),
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
                                                                                    child: CircularProgressIndicator(),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ));
                                                                // Get.to(
                                                                //     ServicesPage());
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
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
                                                                          image: DecorationImage(
                                                                              image: NetworkImage(documentSnapshot['scimage'].toString()),
                                                                              fit: BoxFit.cover),
                                                                        )),
                                                                    Container(
                                                                      height: dimension
                                                                          .height45,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                10),
                                                                        child:
                                                                            Text(
                                                                          documentSnapshot['scname']
                                                                              .toString(),
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
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
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
                          child: CircularProgressIndicator(
                            color: AppColors.Colorq,
                            strokeCap: StrokeCap.round,

                          ),
                        );
                      },
                    ),
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
                        dimension.height65,
                    child: StreamBuilder(
                      stream: refServices.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              num serviceRating =
                                  documentSnapshot.get("serviceRating");
                              num ratingUsers =
                                  documentSnapshot.get("ratingUsers");
                              double result = serviceRating / ratingUsers;
                              return mostBookServices
                                      .contains(documentSnapshot.id)
                                  ? Bounce(
                                      duration: Duration(milliseconds: 200),
                                      onPressed: () {
                                        Get.to(ServiceDescription(
                                          serviceId: documentSnapshot.id,
                                        ));
                                      },
                                      child: ServiceContainer(
                                        image: documentSnapshot.get("images"),
                                        srvName:
                                            documentSnapshot.get("serviceName"),
                                        srvRating:
                                            '${result}(${(ratingUsers.round())})',
                                        srvPrice:
                                            "${documentSnapshot.get("servicePrice")}",
                                      ),
                                    )
                                  // documentSnapshot.get("subcategory")
                                  : SizedBox();
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.Colorq,
                            strokeCap: StrokeCap.round,

                          ),
                        );
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

                      return GestureDetector(
                        onTap: () {
                          Get.to(ServiceDescription(
                            serviceId: Slider2service[index],
                          ));
                        },
                        child: Container(

                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Slider2Images[index]),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(7)),
                        ),
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
                      itemCount: newAndNoteworthySC.length,
                      itemBuilder: (context, index) {
                        return Bounce(
                          duration: Duration(milliseconds: 200),
                          onPressed: () {
                            Get.bottomSheet(
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Bounce(
                                      duration: Duration(milliseconds: 200),
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
                                    height: dimension.height100 * 2.99,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            newAndNoteworthySC[index]
                                                ["subCategory"],
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontSize: dimension.height20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Container(
                                          height: dimension.height100 * 2,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
                                          child: Container(
                                            height: 246,
                                            child: StreamBuilder(
                                              stream: refCategory
                                                  .doc(newAndNoteworthySC[index]
                                                      ["category"])
                                                  .collection("subcategories")
                                                  .doc(newAndNoteworthySC[index]
                                                      ["subCategory"])
                                                  .collection("sections")
                                                  .snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot<QuerySnapshot>
                                                      streamSnapshot) {
                                                if (streamSnapshot.hasData) {
                                                  return GridView.builder(
                                                    itemCount: streamSnapshot
                                                        .data!.docs.length,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 3,
                                                            childAspectRatio:
                                                                0.92
                                                            // Number of columns
                                                            ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      final DocumentSnapshot
                                                          documentSnapshot =
                                                          streamSnapshot.data!
                                                              .docs[index];
                                                      return Bounce(
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        onPressed: () {
                                                          sectionName =
                                                              documentSnapshot
                                                                  .id;
                                                          Get.back();
                                                          Get.to(
                                                              ServicesPage());
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                  height: 70,
                                                                  width: 70,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            dimension.height7),
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(documentSnapshot['simage']
                                                                            .toString()),
                                                                        fit: BoxFit
                                                                            .cover),
                                                                  )),
                                                              Container(
                                                                height: dimension
                                                                    .height45,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10),
                                                                  child: Center(
                                                                    child: Text(
                                                                      documentSnapshot[
                                                                              'sname']
                                                                          .toString(),
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: GoogleFonts.poppins(
                                                                          color: AppColors
                                                                              .Colorq,
                                                                          fontSize: dimension
                                                                              .height14,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
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
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                            setState(() {});
                          },
                          child: Container(
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
                                                newAndNoteworthySC[index]
                                                    ["image"]),
                                            fit: BoxFit.cover)),
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
                                          newAndNoteworthySC[index]['name'],
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
                      itemCount: cleaningAndPest.length,
                      itemBuilder: (context, index) {
                        return Bounce(
                          duration: Duration(milliseconds: 200),
                          onPressed: () {
                            Get.bottomSheet(
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Bounce(
                                      duration: Duration(milliseconds: 200),
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
                                    height: dimension.height100 * 2.99,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            cleaningAndPest[index]
                                                ["subCategory"],
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontSize: dimension.height20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Container(
                                          height: dimension.height100 * 2,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
                                          child: Container(
                                            height: 246,
                                            child: StreamBuilder(
                                              stream: refCategory
                                                  .doc(cleaningAndPest[index]
                                                      ["category"])
                                                  .collection("subcategories")
                                                  .doc(cleaningAndPest[index]
                                                      ["subCategory"])
                                                  .collection("sections")
                                                  .snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot<QuerySnapshot>
                                                      streamSnapshot) {
                                                if (streamSnapshot.hasData) {
                                                  return GridView.builder(
                                                    itemCount: streamSnapshot
                                                        .data!.docs.length,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 3,
                                                            childAspectRatio:
                                                                0.92
                                                            // Number of columns
                                                            ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      final DocumentSnapshot
                                                          documentSnapshot =
                                                          streamSnapshot.data!
                                                              .docs[index];
                                                      return Bounce(
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        onPressed: () {
                                                          sectionName =
                                                              documentSnapshot
                                                                  .id;
                                                          Get.back();
                                                          Get.to(
                                                              ServicesPage());
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                  height: 70,
                                                                  width: 70,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            dimension.height7),
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(documentSnapshot['simage']
                                                                            .toString()),
                                                                        fit: BoxFit
                                                                            .cover),
                                                                  )),
                                                              Container(
                                                                height: dimension
                                                                    .height45,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10),
                                                                  child: Center(
                                                                    child: Text(
                                                                      documentSnapshot[
                                                                              'sname']
                                                                          .toString(),
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: GoogleFonts.poppins(
                                                                          color: AppColors
                                                                              .Colorq,
                                                                          fontSize: dimension
                                                                              .height14,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
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
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                            setState(() {});
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: dimension.width12),
                            child: Column(
                              children: [
                                Container(
                                  width: 150,
                                  child: Text(
                                    cleaningAndPest[index]['name'],
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
                                              cleaningAndPest[index]["image"]),
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
                    child: StreamBuilder(
                      stream: refServices.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              return quickHomeRepair2
                                      .contains(documentSnapshot.id)
                                  ? ServiceContainer(
                                      image: documentSnapshot.get("images"),
                                      srvName:
                                          documentSnapshot.get("serviceName"),
                                      srvRating: documentSnapshot
                                          .get("ratingUsers")
                                          .toString(),
                                      srvPrice:
                                          documentSnapshot.get("servicePrice"),
                                    )
                                  : SizedBox();
                            },
                          );
                        }
                        return Center(
                          child:CircularProgressIndicator(
                            color: AppColors.Colorq,
                            strokeCap: StrokeCap.round,

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
                    height: dimension.height100 + dimension.height65,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: acApplianceRepair.length,
                        itemBuilder: (context, index) {
                          return Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.bottomSheet(
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Bounce(
                                        duration: Duration(milliseconds: 200),
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
                                      height: dimension.height100 * 2.99,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              acApplianceRepair[index]
                                                  ["subCategory"],
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontSize: dimension.height20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Container(
                                            height: dimension.height100 * 2,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
                                            child: Container(
                                              height: 246,
                                              child: StreamBuilder(
                                                stream: refCategory
                                                    .doc(
                                                        acApplianceRepair[index]
                                                            ["category"])
                                                    .collection("subcategories")
                                                    .doc(
                                                        acApplianceRepair[index]
                                                            ["subCategory"])
                                                    .collection("sections")
                                                    .snapshots(),
                                                builder: (context,
                                                    AsyncSnapshot<QuerySnapshot>
                                                        streamSnapshot) {
                                                  if (streamSnapshot.hasData) {
                                                    return GridView.builder(
                                                      itemCount: streamSnapshot
                                                          .data!.docs.length,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 3,
                                                              childAspectRatio:
                                                                  0.92
                                                              // Number of columns
                                                              ),
                                                      itemBuilder:
                                                          (context, index) {
                                                        final DocumentSnapshot
                                                            documentSnapshot =
                                                            streamSnapshot.data!
                                                                .docs[index];
                                                        return Bounce(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  200),
                                                          onPressed: () {
                                                            sectionName =
                                                                documentSnapshot
                                                                    .id;
                                                            Get.back();
                                                            Get.to(
                                                                ServicesPage());
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                    height: 70,
                                                                    width: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              dimension.height7),
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(documentSnapshot['simage']
                                                                              .toString()),
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    )),
                                                                Container(
                                                                  height: dimension
                                                                      .height45,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        documentSnapshot['sname']
                                                                            .toString(),
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: GoogleFonts.poppins(
                                                                            color:
                                                                                AppColors.Colorq,
                                                                            fontSize: dimension.height14,
                                                                            fontWeight: FontWeight.w400),
                                                                      ),
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
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                              setState(() {});
                            },
                            child: ServiceContainer2(
                                srvName: acApplianceRepair[index]["name"],
                                srvImage: acApplianceRepair[index]["image"]),
                          );
                        }),
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
                    height: dimension.height100 + dimension.height65,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: massageForMen.length,
                        itemBuilder: (context, index) {
                          return Bounce(
                            onPressed: () {
                              sectionName = massageForMen[index]["section"];
                              Get.to(ServicesPage());
                            },
                            duration: Duration(milliseconds: 200),
                            child: ServiceContainer2(
                                srvName: massageForMen[index]["name"],
                                srvImage: massageForMen[index]["image"]),
                          );
                        }),
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
                    height: dimension.height100 + dimension.height65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allServices.length,
                      itemBuilder: (context, index) {
                        if (allServices[index]["category"] == "spaWomen") {
                          return Bounce(
                            onPressed: () {
                              sectionName = allServices[index]["section"];
                              Get.to(ServicesPage());
                            },
                            duration: Duration(milliseconds: 200),
                            child: ServiceContainer2(
                                srvName: allServices[index]["name"],
                                srvImage: allServices[index]["image"]),
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
                    height: dimension.height100 + dimension.height65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allServices.length,
                      itemBuilder: (context, index) {
                        if (allServices[index]["category"] == "salonWomen") {
                          return Bounce(
                            onPressed: () {
                              sectionName = allServices[index]["section"];
                              Get.to(
                                ServicesPage(),
                              );
                            },
                            duration: Duration(milliseconds: 200),
                            child: ServiceContainer2(
                                srvName: allServices[index]["name"],
                                srvImage: allServices[index]["image"]),
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
                  Text(
                    "Salon for Kids & Men",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  SizedBox(
                    height: dimension.height100 + dimension.height65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allServices.length,
                      itemBuilder: (context, index) {
                        if (allServices[index]["category"] == "men") {
                          return Bounce(
                            onPressed: () {
                              sectionName = allServices[index]["name"];
                              Get.to(
                                ServicesPage(),
                              );
                            },
                            duration: Duration(milliseconds: 200),
                            child: ServiceContainer2(
                                srvName: allServices[index]["name"],
                                srvImage: allServices[index]["image"]),
                          );
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
