import 'dart:io';

import 'package:city_serve/src/authentication/login_eith_phone_number.dart';
import 'package:city_serve/src/authentication/signUp.dart';
import 'package:city_serve/src/location/googleLocation.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/util.dart';
import 'Forgotpassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
  final TextEditingController phoneController = TextEditingController();

  // Future<void> signInWithPhoneNumber(String phoneNumber) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //
  //   await auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {},
  //     codeSent: (String verificationId, int? resendToken) async {
  //       String smsCode = ''; //get sms code from user
  //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId,
  //         smsCode: smsCode,
  //       );
  //       Get.to(OtpPage(), arguments: [verificationId]);
  //       await auth.signInWithCredential(credential);
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  // void _userLogin() async {
  //   String mobile = phoneController.text;
  //   if (mobile == "") {
  //     // print(screenWidth.toString());
  //
  //     Get.snackbar(
  //       "Please enter the mobile number!",
  //       "To get OTP ",
  //       colorText: AppColors.Colorq,
  //     );
  //   } else {
  //     signInWithPhoneNumber("+${selectedCountry.phoneCode}$mobile");
  //   }
  // }
  bool spwd = true;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Utils().tostmessage(value.user!.email.toString());
      Get.off(GoogleLocation());
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().tostmessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("tapped");

        setState(
          () {
            exit(0);
          },
        );
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: dimension.height70,
                  ),
                  Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        color: AppColors.Colorq,
                        fontSize: dimension.height36,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: dimension.height50,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(7)),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.Colorq,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: "Email Address",
                                labelStyle: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300),
                                contentPadding:
                                    EdgeInsets.fromLTRB(5, 10, 5, 0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.Colorq),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.red),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.red),
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                              if (value.isEmpty) {
                                return 'Enter Email';
                              } else if (!emailValid) {
                                return 'Enter Valid Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: dimension.height15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(7)),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: spwd,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              suffixIcon:
                                  Icon(Icons.password, color: AppColors.Colorq),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Password",
                              labelStyle: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300),
                              contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.Colorq),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.red),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.red),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    spwd = !spwd;
                                  });
                                },
                                child: Icon(spwd
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: dimension.height12,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {
                          Get.to(ForgotPassword());
                        },
                        child: Text(
                          "Forgot Password? ",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimension.height20,
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 400),
                    onPressed: () {
                      print("tapped");

                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: Container(
                      height: dimension.height50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColors.Colorq,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: dimension.height45,
                  ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 400),
                        onPressed: () {
                          print("tapped");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ));

                          // Get.to(() => SignUp());
                        },
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: dimension.height50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Divider(
                          thickness: 1,
                          color: AppColors.Colorq,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Center(
                          child: Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.to(GoogleLocation());
                            },
                            child: Text(
                              "Or Continue With",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.font14,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Divider(
                          thickness: 1,
                          color: AppColors.Colorq,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimension.height40,
                  ),
                  Container(
                    height: dimension.height50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.Colorq.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: dimension.height80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black12),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset("assets/logo/googleLogo.png",
                                  height: dimension.height50),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: dimension.width28,
                        ),
                        Text(
                          "Sign In With Google",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 200),
                    onPressed: () {
                      // Get.bottomSheet(
                      //   isDismissible: true,
                      //   Container(
                      //     height: 250,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.only(
                      //             topLeft: Radius.circular(10),
                      //             topRight: Radius.circular(10))),
                      //     child: Column(
                      //       children: [
                      //         SizedBox(height: dimension.height20,),
                      //         Text(
                      //           "Enter your mobile number to proceed",
                      //           style: GoogleFonts.ubuntu(
                      //               color: AppColors.Colorq,
                      //               fontSize: dimension.height16,
                      //               fontWeight: FontWeight.w600),
                      //         ),
                      //         SizedBox(
                      //           height: 25,
                      //         ),
                      //         Container(
                      //           margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      //           child: TextFormField(
                      //             keyboardType: TextInputType.number,
                      //             cursorColor: AppColors.Colorq,
                      //             controller: phoneController,
                      //             style:  TextStyle(
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.bold,
                      //               color: AppColors.Colorq,
                      //             ),
                      //             onChanged: (value) {
                      //               setState(() {
                      //                 phoneController.text = value;
                      //               });
                      //             },
                      //             decoration: InputDecoration(
                      //               // fillColor: const Color(0xff2C474A),
                      //               // filled: true,
                      //               hintText: "Mobile number",
                      //
                      //               hintStyle: TextStyle(
                      //                 fontWeight: FontWeight.w500,
                      //                 fontSize: 16,
                      //                 color: AppColors.Colorq.withOpacity(0.9),
                      //               ),
                      //               floatingLabelBehavior: FloatingLabelBehavior.never,
                      //               contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      //               focusedBorder: OutlineInputBorder(
                      //                   borderRadius: BorderRadius.circular(100.0),
                      //                   borderSide:
                      //                   BorderSide(color: AppColors.Colorq)),
                      //               enabledBorder: OutlineInputBorder(
                      //                   borderRadius: BorderRadius.circular(dimension.height7),
                      //                   borderSide: BorderSide(color: AppColors.Colorq)),
                      //               // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                      //               // focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                      //               prefixIcon: Container(
                      //                 padding: const EdgeInsets.all(8.0),
                      //                 child: InkWell(
                      //                   onTap: () {
                      //                     showCountryPicker(
                      //                         context: context,
                      //                         countryListTheme: const CountryListThemeData(
                      //                           bottomSheetHeight: 550,
                      //                         ),
                      //                         onSelect: (value) {
                      //                           setState(() {
                      //                             selectedCountry = value;
                      //                           });
                      //                         });
                      //                   },
                      //                   child: Container(
                      //                     padding: const EdgeInsets.all(8.0),
                      //                     child: Text(
                      //                       "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                      //                       style: const TextStyle(
                      //                         fontSize: 18,
                      //                         color: AppColors.Colorq,
                      //                         fontWeight: FontWeight.bold,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               suffixIcon: phoneController.text.length > 9
                      //                   ? Container(
                      //                 height: 25,
                      //                 width: 25,
                      //                 margin: const EdgeInsets.all(10.0),
                      //                 decoration: const BoxDecoration(
                      //                   shape: BoxShape.circle,
                      //                   color: Colors.green,
                      //                 ),
                      //                 child: const Icon(
                      //                   Icons.done,
                      //                   color: Colors.white,
                      //                   size: 20,
                      //                 ),
                      //               )
                      //                   : null,
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 25,
                      //         ),
                      //         Bounce(
                      //           duration: Duration(milliseconds: 300),
                      //           onPressed: _userLogin,
                      //           child: Container(
                      //             height: 50,
                      //             width: 200,
                      //             decoration: BoxDecoration(
                      //                 color: AppColors.Colorq,
                      //                 borderRadius: BorderRadius.circular(26)),
                      //             child: Center(
                      //                 child: Text(
                      //                   "Continue",
                      //                   style: GoogleFonts.ubuntu(
                      //                       color: Colors.white,
                      //                       fontSize: dimension.height16,
                      //                       fontWeight: FontWeight.w500),
                      //                 )),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // );
                      Get.to(LoginWithPhoneNumber());
                    },
                    child: Container(
                      height: dimension.height50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColors.Colorq.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: dimension.height80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black12),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.asset("assets/logo/callLogo.png",
                                    height: dimension.height50),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: dimension.width30,
                          ),
                          Text(
                            "Sign In With OTP",
                            style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
