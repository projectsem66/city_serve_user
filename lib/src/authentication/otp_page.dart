// import 'package:burger_bite/pages/userName.dart';
// import 'package:burger_bite/utils/colors.dart';
import 'package:city_serve/navigationBar.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../login/round_button.dart';
import '../../utils/colors.dart';
import '../signUp2.dart';

class OtpPage extends StatefulWidget {
  final String verificatioId;

  const OtpPage({super.key, required this.verificatioId});

  @override
  _OtpPageState createState() => _OtpPageState();
}

FirebaseAuth auth = FirebaseAuth.instance;
String MonoAuthUid="";

class _OtpPageState extends State<OtpPage> {
  bool loading = false;

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  final TextEditingController _fifthController = TextEditingController();
  final TextEditingController _sixthController = TextEditingController();
  String? otpCode;

  // final String verificationId = Get.arguments[0];

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
                  // Text(
                  //   phoneController.text,
                  //   style: GoogleFonts.poppins(
                  //       color: AppColors.Colorq,
                  //       fontSize: dimension.height18,
                  //       fontWeight: FontWeight.w500),
                  // ),
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
                    child: RoundButton(
                      title: "verify",
                      loding: loading,
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        final credential = PhoneAuthProvider.credential(
                          verificationId: widget.verificatioId,
                          smsCode: otpCode.toString(),
                        );
                        try {
                          await auth.signInWithCredential(credential);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp2()));
                          print("aaaaaaaaaaaaaaa"+auth.currentUser!.uid.toString());
                          MonoAuthUid = auth.currentUser!.uid.toString();
                        } catch (e) {}
                      },
                    ),
                  ),
                  // ElevatedButton(
                  //     style: style,
                  //     onPressed: _login,
                  //     child: const Text(
                  //       'SIGN IN',
                  //       style: TextStyle(fontSize: 14, color: Colors.white),
                  //     )),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
