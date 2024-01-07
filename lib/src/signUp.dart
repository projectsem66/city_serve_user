import 'package:city_serve/src/page/dashboard.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: dimension.height65,
                ),
                Container(
                  height: dimension.height90,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.Colorq),
                ),
                SizedBox(
                  height: dimension.height25,
                ),
                Center(
                  child: Text(
                    "Create Your Account",
                    style: GoogleFonts.amaranth(
                        color: AppColors.Colorq, fontSize: dimension.height24),
                  ),
                ),
                SizedBox(
                  height: dimension.height25,
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "First Name",
                      labelStyle: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Last Name",
                      labelStyle: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Email Address",
                      labelStyle: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Mobile Number",
                      labelStyle: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Password",
                      labelStyle: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
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
                  height: dimension.height20,
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Confirm Password",
                      labelStyle: GoogleFonts.amaranth(
                          color: AppColors.Colorq,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
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
                  height: dimension.height20,
                ),
                Bounce(
                  duration: Duration(milliseconds: 400),
                  onPressed: () {
                    Get.to(Dashboard());
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
