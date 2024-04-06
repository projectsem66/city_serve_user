import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:city_serve/utils/round_button.dart';

import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/util.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: dimension.height100*1.3,
            ),

            Text(
              "Enter your Email Address to Proceed",
              style: GoogleFonts.poppins(
                  color: AppColors.Colorq,
                  fontSize: dimension.height16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dimension.height7),              color: AppColors.Colorq.withOpacity(0.05),

              ),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Email",
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
              ),
            ),
            SizedBox(height: 40,),
            RoundButton(title: "Send Link", onTap: () {
              auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value) {
                Utils().tostmessage("we send you  email,please check email");
              }).onError((error, stackTrace) {
                Utils().tostmessage(error.toString());
              });
            },)
          ],
        ),
      ),
    );
  }
}
