import 'dart:io';

import 'package:city_serve/src/authentication/login_eith_phone_number.dart';
import 'package:city_serve/src/authentication/signUp.dart';
import 'package:city_serve/src/authentication/signUp2.dart';
import 'package:city_serve/src/location/googleLocation.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/util.dart';
import 'Forgotpassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
String crrUserEmail = "";
// final emailController = TextEditingController();

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
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential authResult =
        await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        crrUserEmail = user!.email.toString();
        return user;

      }
    } catch (error) {
      print(error);
    }
    return null;
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
                                ),
                            ),
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
                                    : Icons.visibility,color: AppColors.Colorq,),
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
                          "Sign Up",
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
                  Bounce(
                    duration: Duration(milliseconds: 200),
                    onPressed: ()
                    async {
                      User? user = await _handleSignIn();
                      if (user != null) {
                        authUid = user.uid;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp2(),
                          ),
                        );
                      }
                    },
                    child: Container(
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
                  ),
                  SizedBox(
                    height: dimension.height15,
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 200),
                    onPressed: () {

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
