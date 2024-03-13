import 'package:city_serve/firebaseService/fbRefrences.dart';
import 'package:city_serve/src/page/cartPages/summary.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

String bookServiceId = "";
String ServiceProviderId = "";
String serviceImg = "";
String serviceName = "";
String serviceDuration = "";
String providerName = "";
String servicePrice = "";

class _ServiceDescriptionState extends State<ServiceDescription> {
  // late final String phoneNumber;


  callProviderNumber(String phoneNumber) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (!res!) {
      // Handle error
    }
  }
  DocumentSnapshot? documentSnapshot;
  DocumentSnapshot? documentSnapshot1;

  @override
  void initState() {
    super.initState();
    print(widget.serviceId);

    bookServiceId = widget.serviceId;
    fetchServiceData();
  }

  // for get service details
  Future<void> fetchServiceData() async {
    try {
      DocumentSnapshot snapshot = await getDocument();
      setState(() {
        documentSnapshot = snapshot;
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
        refProvider.doc(documentSnapshot!.get("providerId"));
    return documentReference.get();
  }

  bool like = false;
  final CollectionReference refUser = FirebaseFirestore.instance
      .collection('userDetails')
      .doc("234")
      .collection("favourites");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: documentSnapshot != null
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
                                            documentSnapshot!.get("images")),
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
                                          like = !like;
                                          like == true
                                              ? refUser
                                                  .doc(widget.serviceId)
                                                  .set({
                                                  "serviceId": widget.serviceId
                                                })
                                              : refUser
                                                  .doc(widget.serviceId)
                                                  .delete();

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
                                            child: like == true
                                                ? Icon(
                                                    Icons.favorite,
                                                    color: AppColors.red,
                                                    size: dimension.height26,
                                                  )
                                                : Icon(
                                                    Icons.favorite_border,
                                                    color: AppColors.red,
                                                    size: dimension.height26,
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
                                          documentSnapshot!.get("category"),
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
                                          documentSnapshot!.get("serviceName"),
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
                                          documentSnapshot!.get("servicePrice"),
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
                                              documentSnapshot!
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
                              documentSnapshot!.get("serviceDescription"),
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
                                              image: DecorationImage(image: NetworkImage(documentSnapshot!.get("providerImage"))),
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
                                                  documentSnapshot!.get("providerName") ??
                                                      "hello",
                                                  // myObject?.property ?? 'Default Value'
                                                  style: GoogleFonts.poppins(
                                                      color: AppColors.Colorq,
                                                      fontSize:
                                                          dimension.height20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),Text(
                                                  documentSnapshot!.get("providerPhoneNumber") ??
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
                                              callProviderNumber(documentSnapshot!.get("providerPhoneNumber"));
                                            },
                                            duration: Duration(milliseconds: 200),
                                            child: Container(
                                              height: dimension.height40,
                                              width: dimension.height40,
                                              decoration: BoxDecoration(
                                                  color: AppColors.Colorq.withOpacity(
                                                      0.3),
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
                      onPressed: () {
                        serviceImg = documentSnapshot!.get("images");
                        serviceName = documentSnapshot!.get("serviceName");
                        servicePrice = documentSnapshot!.get("servicePrice");
                        serviceDuration =
                            documentSnapshot!.get("serviceDuration");
                        providerName = documentSnapshot1?.get("firstName");
                        ServiceProviderId = documentSnapshot!.get("providerId");
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
