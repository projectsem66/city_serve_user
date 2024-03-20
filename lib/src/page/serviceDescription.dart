import 'dart:convert';

import 'package:city_serve/firebaseService/fbRefrences.dart';
import 'package:city_serve/src/authentication/otp_page.dart';
import 'package:city_serve/src/page/cartPages/summary.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emailjs/emailjs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

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
String providerImg = "";

// Future<int> sendEmail() async {
//   try {
//     final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
//     const serviceId = "service_ghou07f";
//     const templateId = "template_nq97y76";
//     const userId = "uF3GpmwgmWRD7J8pc";
//
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         "service_id": serviceId,
//         "template_id": templateId,
//         "template_params": {
//           "from_name": "Your Name",
//           "to_name": "Recipient's Name",
//           "status": "Accepted"
//         }
//       }),
//     );
//
//     print('Email sent. Response status code: ${response.statusCode}');
//     return response.statusCode;
//   } catch (e) {
//     print('Error sending email: $e');
//     return -1;
//   }
// }
// Future<bool> sendEmail1(dynamic templateParams) async {
//   try {
//     await EmailJS.send(
//       'service_ghou07f',
//       'template_nq97y76',
//
//       templateParams,
//       const Options(
//         publicKey: 'uF3GpmwgmWRD7J8pc',
//       ),
//     );
//     print('SUCCESS!');
//     return true;
//   } catch (error) {
//     if (error is EmailJSResponseStatus) {
//       print('ERROR... ${error.status}: ${error.text}');
//     }
//     print(error.toString());
//     return false;
//   }
// }
Future<void> Send_mail() async {
  var Service_id = 'service_ghou07f';
  var Template_id = 'template_nq97y76';
  var User_id = 'uF3GpmwgmWRD7J8pc';
  var recipientEmail = 'aniketpandavap@gmail.com';

  var response = await http.post(
    Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
    headers: {
      'origin': 'http:localhost',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'service_id': Service_id,
      'user_id': User_id,
      'template_id': Template_id,

      'template_params': {
        'name': 'jawad',
        'message': 'This is just a test email',
        'sender_email': 'aniketpandavap@gmail.com',
      },
      'recipient_email': recipientEmail,

    }),
  );

  if (response.statusCode == 200) {
    print('Email sent successfully');
  } else {
    print('Failed to send email. Status code: ${response.statusCode}');
  }
}



// Future<bool> sendEmail(dynamic templateParams) async {
//   try {
//     await EmailJS.send(
//       'service_ghou07f',
//       'template_nq97y76',
//       templateParams,
//       const Options(
//         publicKey: 'uF3GpmwgmWRD7J8pc',
//       ),
//     );
//     print('SUCCESS!');
//     return true;
//   } catch (error) {
//     if (error is EmailJSResponseStatus) {
//       print('ERROR... ${error.status}: ${error.text}');
//     }
//     print(error.toString());
//     return false;
//   }
// }
dynamic templateParams = {
  'name': 'jawad',
  'message': 'This is just a test email',
  'sender_email': 'aniketpandavap@gmail.com',
  'recipient_email': 'aniketpandav0711@gmail.com', // Specify recipient's email
};
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
    // sendEmail();
    setState(() {});
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

  // double result = serviceRating / ratingUsers;
  @override
  Widget build(BuildContext context) {

    num serviceRating = serviceDetailsSS?.get("serviceRating");
    num ratingUsers = serviceDetailsSS?.get("ratingUsers");
    num res = serviceRating / ratingUsers;
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
                                              '${res}(${(ratingUsers.round())})',
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
                                Send_mail();
                                // sendEmail(templateParams);
                                // sendEmail1(templateParams);
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
                        providerImg = serviceDetailsSS!.get("providerImage");
                        itemPrice =
                            int.parse(serviceDetailsSS?.get("servicePrice"));

                        Get.to(SummaryPage(),
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
