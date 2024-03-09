import 'dart:developer';

import 'package:city_serve/utils/dimension.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'otp_page.dart';


double screenWidth = Get.context!.width;

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}
final TextEditingController phoneController = TextEditingController();


class _LogInState extends State<LogIn> {
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = ''; //get sms code from user
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );
        Get.to(OtpPage(), arguments: [verificationId]);
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void _userLogin() async {
    String mobile = phoneController.text;
    if (mobile == "") {
      print(screenWidth.toString());

      Get.snackbar(
        "Please enter the mobile number!",
        "To get OTP ",
        colorText: AppColors.Colorq,
      );
    } else {
      signInWithPhoneNumber("+${selectedCountry.phoneCode}$mobile");
    }
  }

  void initState() {
    super.initState();
    log('Load Event');
  }

  // LogIn({super.key});
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xffd6c1a8),
      body: SafeArea(
        child: Container(
          height: screenheight(),
          width: screenwidth(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  Color(0xfff1e5d8),
                  Color(0xffd8c2ab),
                  Color(0xffd8c2ab)
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                  ),

                  Text(
                    "Enter your mobile number to proceed",
                    style: GoogleFonts.ubuntu(
                        color: AppColors.Colorq,
                        fontSize: dimension.height16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: AppColors.Colorq,
                      controller: phoneController,
                      style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Colorq,
                      ),
                      onChanged: (value) {
                        setState(() {
                          phoneController.text = value;
                        });
                      },
                      decoration: InputDecoration(
                        // fillColor: const Color(0xff2C474A),
                        // filled: true,
                        hintText: "Mobile number",

                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.Colorq.withOpacity(0.9),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide:
                            BorderSide(color: AppColors.Colorq)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(color: Color(0xff4c1514))),
                        // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                        // focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              showCountryPicker(
                                  context: context,
                                  countryListTheme: const CountryListThemeData(
                                    bottomSheetHeight: 550,
                                  ),
                                  onSelect: (value) {
                                    setState(() {
                                      selectedCountry = value;
                                    });
                                  });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColors.Colorq,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        suffixIcon: phoneController.text.length > 9
                            ? Container(
                          height: 25,
                          width: 25,
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 300),
                    onPressed: _userLogin,
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: AppColors.Colorq,
                          borderRadius: BorderRadius.circular(26)),
                      child: Center(
                          child: Text(
                            "Continue",
                            style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontSize: dimension.height16,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 1,
                          // width: 107,
                          // color: Colors.grey,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff4c1514).withOpacity(0),
                                Color(0xff4c1514),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Bounce(
                          duration: Duration(milliseconds: 300),
                          onPressed: () {
                            // Get.to(() => UserName());
                          },
                          child: Center(
                            child: Text(
                              "OR",
                              style: GoogleFonts.amaranth(
                                fontSize: 22,
                                color: Color(0xff4c1514),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 1,
                          // width: 120,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff4c1514),
                                Color(0xff4c1514).withOpacity(0),
                              ])),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Login using",
                    style: GoogleFonts.amaranth(
                        color: AppColors.Colorq,
                        fontSize: dimension.height19,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () async {
                  //         print("Tapped");
                  //         await FirebaseServices().signInWithGoogle();
                  //         Get.off(() => UserName());
                  //       },
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //                 color: Color(0xff4c1514), width: 1),
                  //             borderRadius: BorderRadius.circular(50)),
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(
                  //               top: 5, bottom: 5, left: 20, right: 20),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Image(
                  //                   image: AssetImage(
                  //                     'assets/images/googleLogo.png',
                  //                   ),
                  //                   height: Dimensions.height28),
                  //               SizedBox(
                  //                 width: Dimensions.width10,
                  //               ),
                  //               Text(
                  //                 "Google",
                  //                 style: GoogleFonts.roboto(
                  //                     fontSize: 18,
                  //                     color: AppColors.mainBrown,
                  //                     fontWeight: FontWeight.w600),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 60,
                  // ),
                  // Center(
                  //   child: Text.rich(
                  //     TextSpan(
                  //       spellOut: true,
                  //       children: [
                  //         TextSpan(
                  //           recognizer: TapGestureRecognizer()
                  //             ..onTap = () => Get.to(TermsCondition(),
                  //                 transition: Transition.downToUp,
                  //                 duration: Duration(milliseconds: 300)),
                  //           text: 'terms & conditions  ',
                  //           style: GoogleFonts.ubuntu(
                  //               fontWeight: FontWeight.w700,
                  //               fontSize: 16,
                  //               color: Color(0xff4c1514),
                  //               decoration: TextDecoration.underline,
                  //               decorationStyle: TextDecorationStyle.solid),
                  //         ),
                  //         TextSpan(
                  //           text: 'and ',
                  //           style: GoogleFonts.ubuntu(
                  //               color: Color(0xff4c1514),
                  //               fontSize: Dimensions.font16,
                  //               fontWeight: FontWeight.w500),
                  //         ),
                  //         TextSpan(
                  //           recognizer: TapGestureRecognizer()
                  //             ..onTap = () => Get.to(PrivacyPolicy(),
                  //                 transition: Transition.downToUp,
                  //                 duration: Duration(milliseconds: 300)),
                  //           text: '  privacy policy',
                  //           style: GoogleFonts.ubuntu(
                  //               fontWeight: FontWeight.w700,
                  //               fontSize: 16,
                  //               color: Color(0xff4c1514),
                  //               decoration: TextDecoration.underline,
                  //               decorationStyle: TextDecorationStyle.solid),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
