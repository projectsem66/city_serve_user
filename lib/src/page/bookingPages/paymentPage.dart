import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    String selectedPaymentMode = '';

    List<String> paymentModes = [
      "Cash / UPI on Delivery",
      "Credit / Debit Card",
      "Amazon Pay Wallet",
      "Paytm Wallet",
      "PhonePe"
    ];
    String _selectedValue = 'Option 1';
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
                          "₹45",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Divider(thickness: 1),
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
              children: paymentModes.map((mode) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Column(
                    children: [
                      RadioListTile(
                        activeColor: AppColors.Colorq,

                        // Color for the selected radio button
                        title: Text(
                          mode, // Display the payment mode as the title
                          style: GoogleFonts.poppins(
                            fontSize: dimension.height18,
                            color: AppColors.Colorq,
                          ),
                        ),
                        value: mode,
                        groupValue: selectedPaymentMode,
                        onChanged: (value) {
                          selectedPaymentMode = value.toString();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            Bounce(
              duration: Duration(milliseconds: 300),
              onPressed: () {
                if (selectedPaymentMode == "") {
                  // Show a snackbar if no payment mode is selected
                  Get.snackbar(
                    "Please select Payment Mode",
                    "for payment",
                    colorText: Colors.white,
                  );
                } else {
                  // Navigate to the next screen or perform the next action
                  // Get.to(OrderDetail());
                }
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
                    "Next",
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
