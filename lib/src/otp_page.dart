// import 'package:burger_bite/pages/userName.dart';
// import 'package:burger_bite/utils/colors.dart';
import 'package:city_serve/navigationBar.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../utils/colors.dart';
import 'monoAuth.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  final TextEditingController _fifthController = TextEditingController();
  final TextEditingController _sixthController = TextEditingController();
  String? otpCode;
  final String verificationId = Get.arguments[0];
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    _fifthController.dispose();
    _sixthController.dispose();
    super.dispose();
  }

  // verify otp
  void verifyOtp(
    String verificationId,
    String userOtp,
  ) async {
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User? user = (await auth.signInWithCredential(creds)).user;
      if (user != null) {

        Get.off(NavigationBarr());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        e.message.toString(),
        "Try again",
        colorText: AppColors.Colorq,
      );
    }
  }

  void _login() {
    if (otpCode != null) {
      verifyOtp(verificationId, otpCode!);
    } else {
      Get.snackbar(
        "Enter 6-Digit code",
        "To log into the app",
        colorText: AppColors.Colorq,
        // backgroundColor: AppColors.mainOrange.withOpacity(0.3),
      );
    }
  }

  final ButtonStyle style = ElevatedButton.styleFrom(
      minimumSize: Size(188, 48),
      backgroundColor: AppColors.Colorq,
      elevation: 6,
      textStyle: const TextStyle(fontSize: 16),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(50),
      )));

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xff215D5F),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Verify details",
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    phoneController.text,
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height18,
                        fontWeight: FontWeight.w500),
                  ),
                  Center(
                    child: Pinput(
                      length: 6,
                      showCursor: true,
                      focusedPinTheme: PinTheme(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: AppColors.Colorq, width: 2),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: AppColors.Colorq),
                      ),
                      defaultPinTheme: PinTheme(
                        width: dimension.height45,
                        height: dimension.height45,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimension.height7),
                          border: Border.all(color: AppColors.Colorq, width: 2),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.Colorq),
                      ),
                      onCompleted: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: dimension.height30),
                  Center(
                    child: Bounce(
                      onPressed: _login,
                      duration: Duration(milliseconds: 300),
                      child: Container(
                        height: dimension.height50,
                        width: dimension.height100 * 1.6,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.Colorq, width: 2),
                            color: AppColors.Colorq,
                            borderRadius:
                                BorderRadius.circular(dimension.height7)),
                        child: Center(
                          child: Text(
                            "Verify",
                            style: GoogleFonts.amaranth(
                                fontSize: dimension.height20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //     style: style,
                  //     onPressed: _login,
                  //     child: const Text(
                  //       'SIGN IN',
                  //       style: TextStyle(fontSize: 14, color: Colors.white),
                  //     )),
                  const SizedBox(height: 60),
                  Text(
                    "Didn't receive any code?",
                    style: GoogleFonts.amaranth(
                        fontSize: 16, color: AppColors.Colorq),
                  ),

                  const SizedBox(height: 5),
                  Text(
                    "Resend Code",
                    style: GoogleFonts.amaranth(
                        fontSize: 23, color: AppColors.Colorq),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
