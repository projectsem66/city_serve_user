import 'package:city_serve/navigationBar.dart';
import 'package:city_serve/src/page/bookingPages/UPIpage.dart';
import 'package:city_serve/src/page/bookingPages/bookingSubPage.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../firebaseService/fbRefrences.dart';
import '../../../utils/colors.dart';
import 'bookings.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}
double paymentAmount = 0;
int selectedValue = 1;
int? btnState = 1;
DocumentSnapshot? getProviderUPIref;
int tip = 0;

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay = Razorpay();
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
    _razorpay = Razorpay();
    initiateRazorPay();
  }

  initiateRazorPay() {
// To handle different event with previous functions
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successful: ${response.paymentId}");
    // Add your logic for successful payment here
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Error: ${response.code.toString()} - ${response.message}");
    // Add your logic for payment failure here
  }

  void _startPayment() async {
    var options = {
      'key': 'rzp_test_j268DTf9wvugT9',
      // Replace with your Razorpay API key
      'amount': 1000,
      // Amount in the smallest currency unit (e.g., paisa for INR)
      'timeout': 180,
      // Timeout in seconds
      'currency': 'INR',
      'name': 'Aniket Pandav',
      'description': 'Payment for the service',
      'prefill': {'contact': '7016199407', 'email': 'aniketpandav0711@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error starting payment: $e");
    }
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
                          "₹${bookServiceRef?.get("totalPrice")}",
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
                          "Extra Tip",
                          style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "₹$tip",
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
                          "₹${bookServiceRef?.get("totalPrice") + tip}",
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
                RadioListTile(
                  activeColor: AppColors.Colorq,
                  title: Text(
                    "Pay via Razorpay",
                    style: GoogleFonts.poppins(
                      color: AppColors.Colorq,
                      fontSize: dimension.height16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  value: 3,
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
            Text(
              "Add tip:",
              style: GoogleFonts.poppins(
                  color: AppColors.Colorq,
                  fontSize: dimension.height16,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Bounce(
                        onPressed: () {
                          tip = 10;
                          setState(() {});
                        },
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.Colorq, width: 2),
                              borderRadius:
                                  BorderRadius.circular(dimension.height7)),
                          child: Center(
                            child: Text(
                              "₹10",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Bounce(
                        onPressed: () {
                          tip = 20;
                          setState(() {});
                        },
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.Colorq, width: 2),
                              borderRadius:
                                  BorderRadius.circular(dimension.height7)),
                          child: Center(
                            child: Text(
                              "₹20",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Bounce(
                        onPressed: () {
                          tip = 30;
                          setState(() {});
                        },
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.Colorq, width: 2),
                              borderRadius:
                                  BorderRadius.circular(dimension.height7)),
                          child: Center(
                            child: Text(
                              "₹30",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Bounce(
                        onPressed: () {
                          tip = 40;
                          setState(() {});
                        },
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.Colorq, width: 2),
                              borderRadius:
                                  BorderRadius.circular(dimension.height7)),
                          child: Center(
                            child: Text(
                              "₹40",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Bounce(
              duration: Duration(milliseconds: 300),
              onPressed: () {
                paymentAmount =
                    bookServiceRef?.get("totalPrice") + tip.toDouble();
                providerUPIid = getProviderUPIref?.get("upiId");
                print("upi----------${providerUPIid}");
                btnState == 1
                    ? FirebaseFirestore.instance
                        .collection('bookingg')
                        .doc(bookingId)
                        .update({"status": "Paid"})
                    : "";
                btnState == 1
                    ? Get.off(NavigationBarr())
                    : btnState == 2
                        ? Get.to(UpiPage())
                        : btnState == 3
                            ? _startPayment()
                            : "";
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
                    btnState == 1
                        ? "Done"
                        : btnState == 2 || btnState == 3
                            ? "Next"
                            : "",
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
