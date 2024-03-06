import 'package:city_serve/src/location/googleLocation.dart';
import 'package:city_serve/navigationBar.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login/util.dart';
import '../utils/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool spwd = true;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  void signup() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GoogleLocation()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().tostmessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
                    style: GoogleFonts.poppins(
                        color: AppColors.Colorq, fontSize: dimension.height22),
                  ),
                ),
                SizedBox(
                  height: dimension.height25,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "First Name",
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Last Name",
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Email Address",
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Mobile Number",
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
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.black,
                            obscureText: spwd,
                            style: TextStyle(
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Confirm Password",
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
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: dimension.height20,
                ),
                Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      signup();
                    }
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
                        "Sign up",
                        style: GoogleFonts.poppins(
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
