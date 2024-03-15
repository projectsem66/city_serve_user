import 'package:city_serve/firebaseService/fbRefrences.dart';
import 'package:city_serve/src/authentication/otp_page.dart';
import 'package:city_serve/src/page/cartPages/summary.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class ServiceDescription extends StatefulWidget {
  String serviceId;

  ServiceDescription({super.key, required this.serviceId});

  @override
  State<ServiceDescription> createState() => _ServiceDescriptionState();
}

DocumentSnapshot? serviceDetailsSS;
DocumentSnapshot? documentSnapshot1;
String bookServiceId = "";
String ServiceProviderId = "";
String serviceImg = "";
String serviceName = "";
String serviceDuration = "";
String providerName = "";
String servicePrice = "";
String providerMoNo = "";
String currentUid = "";

class _ServiceDescriptionState extends State<ServiceDescription> {
  @override
  User? _user;
  List<String> _favoriteItems = [];

  void _getUser() {
    _user = auth.currentUser;
    if (_user != null) {
      _getFavoriteItems();
    }
  }

  Future<void> _getFavoriteItems() async {
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('userDetails')
        .doc(auth.currentUser?.uid)
        .get();
    setState(() {
      _favoriteItems = List<String>.from(
          (userDoc.data() as Map<String, dynamic>)['favoriteItems']);
    });
  }

  Future<void> _toggleFavoriteItem(String itemId) async {
    setState(() {
      if (_favoriteItems.contains(itemId)) {
        _favoriteItems.remove(itemId);
      } else {
        _favoriteItems.add(itemId);
      }
    });

    await FirebaseFirestore.instance
        .collection('userDetails')
        .doc(auth.currentUser?.uid)
        .update({'favoriteItems': _favoriteItems});
  }

  // late final String phoneNumber;

  callProviderNumber(String phoneNumber) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (!res!) {
      // Handle error
    }
  }

  @override
  void initState() {
    super.initState();
    print(widget.serviceId);
    _getUser();
    bookServiceId = widget.serviceId;
    fetchServiceData();
    getProviderDetails();
    // currentUid = auth.currentUser.uid;
  }

  // for get service details
  Future<void> fetchServiceData() async {
    try {
      DocumentSnapshot snapshot = await getDocument();
      setState(() {
        serviceDetailsSS = snapshot;
      });
    } catch (e) {
      print('Error retrieving document: $e');
      // Handle error appropriately
    }
  }

  Future<DocumentSnapshot> getDocument() async {
    DocumentReference documentReference = refServices.doc(widget.serviceId);
    getProviderDetails();
    return documentReference.get();
  }

  // for get provider details using provider id
  Future<void> getProviderDetails() async {
    try {
      DocumentSnapshot snapshot = await getProvider();
      setState(() {
        documentSnapshot1 = snapshot;
      });
    } catch (e) {
      print('Error retrieving document: $e');
      // Handle error appropriately
    }
  }

  Future<DocumentSnapshot> getProvider() async {
    DocumentReference documentReference =
        refProvider.doc(serviceDetailsSS!.get("providerId"));
    return documentReference.get();
  }

  bool like = false;
  final CollectionReference refFav = FirebaseFirestore.instance
      .collection('userDetails')
      .doc(auth.currentUser?.uid)
      .collection("favourites");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: serviceDetailsSS != null
          ? Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: screenwidth() + dimension.height100 * 0.75,
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: screenwidth(),
                                  width: screenwidth(),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            serviceDetailsSS!.get("images")),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: dimension.height35,
                                      left: dimension.height10,
                                      right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Bounce(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        duration: Duration(milliseconds: 200),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: AppColors.Colorq.withOpacity(
                                                0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                              child: Icon(
                                            Icons.arrow_back,
                                            color: AppColors.Colorq,
                                            size: dimension.height28,
                                          )),
                                        ),
                                      ),
                                      Bounce(
                                        onPressed: () {
                                          _toggleFavoriteItem(widget.serviceId);
                                          setState(() {});
                                        },
                                        duration: Duration(milliseconds: 200),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: AppColors.Colorq.withOpacity(
                                                0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: _favoriteItems
                                                    .contains(widget.serviceId)
                                                ? Icon(
                                                    Icons.favorite,
                                                    color: AppColors.red,
                                                  )
                                                : Icon(
                                                    Icons.favorite_border,
                                                    color: AppColors.red,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: dimension.height15),
                                child: Container(
                                  height: dimension.height100 * 1.69,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        dimension.height7),
                                    border: Border.all(color: AppColors.Colorq),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          serviceDetailsSS!.get("category"),
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
                                          serviceDetailsSS!.get("serviceName"),
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
                                          serviceDetailsSS!.get("servicePrice"),
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
                                              serviceDetailsSS!
                                                  .get("serviceDuration"),
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
                              serviceDetailsSS!.get("serviceDescription"),
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
                            Bounce(
                              duration: Duration(milliseconds: 200),
                              onPressed: () {
                                getProviderDetails();

                                setState(() {});
                              },
                              child: Container(
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
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        serviceDetailsSS!.get(
                                                            "providerImage")),
                                                    fit: BoxFit.cover),
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
                                                  serviceDetailsSS!.get(
                                                          "providerName") ??
                                                      "hello",
                                                  // myObject?.property ?? 'Default Value'
                                                  style: GoogleFonts.poppins(
                                                      color: AppColors.Colorq,
                                                      fontSize:
                                                          dimension.height20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  serviceDetailsSS!.get(
                                                          "providerPhoneNumber") ??
                                                      "hello",
                                                  // myObject?.property ?? 'Default Value'
                                                  style: GoogleFonts.poppins(
                                                      color: AppColors.Colorq,
                                                      fontSize:
                                                          dimension.height20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Bounce(
                                            onPressed: () {
                                              // phoneNumber = documentSnapshot!.get("providerPhoneNumber");
                                              callProviderNumber(
                                                  serviceDetailsSS!.get(
                                                      "providerPhoneNumber"));
                                            },
                                            duration:
                                                Duration(milliseconds: 200),
                                            child: Container(
                                              height: dimension.height40,
                                              width: dimension.height40,
                                              decoration: BoxDecoration(
                                                  color: AppColors.Colorq
                                                      .withOpacity(0.3),
                                                  shape: BoxShape.circle),
                                              child: Icon(Icons.call),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: dimension.height100 * 1,
                            )
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
                      onPressed: () async {
                        getProviderDetails();

                        serviceImg = serviceDetailsSS!.get("images");
                        serviceName = serviceDetailsSS!.get("serviceName");
                        servicePrice = serviceDetailsSS!.get("servicePrice");
                        serviceDuration =
                            serviceDetailsSS!.get("serviceDuration");
                        providerName = serviceDetailsSS?.get("providerName");
                        ServiceProviderId = serviceDetailsSS!.get("providerId");
                        providerMoNo =
                            serviceDetailsSS!.get("providerPhoneNumber");
                        Get.to(Summary(),
                            transition: Transition.circularReveal);
                      },
                      child: Container(
                        height: dimension.height50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: AppColors.Colorq,
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                BorderRadius.circular(dimension.height7)),
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
            )
          : CircularProgressIndicator(),
    );
  }
}
// Center(
// child: documentSnapshot != null
// ? Text(documentSnapshot!.get("images"))
//     : CircularProgressIndicator(), // Show a loading indicator while fetching data
// ),
