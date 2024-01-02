import 'package:city_serve/src/signUp.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: GoogleFonts.amaranth(
                        color: AppColors.Colorq, fontSize: dimension.height36),
                  ),
                ),
                SizedBox(
                  height: dimension.height50,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.Colorq.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email_outlined),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Email Address",
                      labelStyle: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
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
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.password),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Password",
                      labelStyle: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height12,
                ),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "Forgot Password? ",
                      style: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
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
                    Get.to(() => SignUp());
                  },
                  child: Container(
                    height: dimension.height50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.Colorq.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.amaranth(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height35,
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Sign up",
                      style: GoogleFonts.amaranth(
                        color: AppColors.Colorq,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: dimension.height24,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Divider(
                        thickness: 1,
                        color: AppColors.Colorq,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        " Or Continue With",
                        style: GoogleFonts.amaranth(
                            color: AppColors.Colorq,
                            fontSize: dimension.font15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Expanded(
                      flex: 1,
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
                        style: GoogleFonts.amaranth(
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
                Container(
                  height: dimension.height50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.Colorq.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: dimension.height80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black12),
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
                        style: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
