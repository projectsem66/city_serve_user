import 'package:city_serve/navigationBar.dart';
import 'package:city_serve/src/page/bookingPages/bookingSubPage.dart';
import 'package:city_serve/src/page/bookingPages/UPIpage.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../firebaseService/fbRefrences.dart';
import '../../../utils/colors.dart';
import 'bookings.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

int selectedValue = 1;
int? btnState = 1;
DocumentSnapshot? getProviderUPIref;


class _PaymentPageState extends State<PaymentPage> {

  // for get provider details using provider id
  Future<void> getProviderDetails() async {
    try {
      DocumentSnapshot snapshot = await getProvider();
      setState(() {
        getProviderUPIref = snapshot;
      });
    } catch (e) {
      print('Error retrieving document: $e');
      // Handle error appropriately
    }
  }

  Future<DocumentSnapshot> getProvider() async {
    DocumentReference documentReference =
    refProvider.doc(bookServiceRef?.get("providerId"));
    return documentReference.get();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProviderDetails();
  }
  @override
  Widget build(BuildContext context) {
    String selectedPaymentMode = '';
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Get.back();
              });
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: dimension.height15,
            ),
            Text(
              "Price Detail",
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
                  borderRadius: BorderRadius.circular(dimension.height7),
                  border: Border.all(color: AppColors.Colorq)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "₹45",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Extra Charges",
                          style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "₹45",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                         "₹${bookServiceRef?.get("totalPrice")}",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: dimension.height15,
            ),
            Text(
              "Choose Payment Method",
              style: GoogleFonts.poppins(
                  color: AppColors.Colorq,
                  fontSize: dimension.height18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: dimension.height15,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Column(
                    children: [
                      RadioListTile(
                        activeColor: AppColors.Colorq,
                        title: Text(
                          "Cash on Delivery",
                          style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          btnState = value;
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                RadioListTile(
                  activeColor: AppColors.Colorq,
                  title: Text(
                    "Pay via UPI ID",
                    style: GoogleFonts.poppins(
                      color: AppColors.Colorq,
                      fontSize: dimension.height16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    btnState = value;
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            Bounce(
              duration: Duration(milliseconds: 300),
              onPressed: () {
                paymentAmount = bookServiceRef?.get("totalPrice")+0.00;
                providerUPIid = getProviderUPIref?.get("upiId");
                print("upi----------${providerUPIid}");
                btnState==1?
                FirebaseFirestore.instance
                    .collection('bookingg')
                    .doc(bookingId)
                    .update({"status": "Paid"}):"";
                btnState==1?
                Get.off(NavigationBarr()):btnState==2?Get.to(UpiPage()):"";
              },
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.Colorq,
                ),
                child: Center(
                  child: Text(
                    btnState==1?
                    "Done":btnState==2?"Next":"",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
