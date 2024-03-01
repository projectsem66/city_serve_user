import 'package:city_serve/googleLocation.dart';
import 'package:city_serve/src/signUp.dart';
import 'package:city_serve/utils/colors.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login/Forgotpassword.dart';
import '../login/util.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GoogleLocation()));
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
                              contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.Colorq),
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
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
                              borderSide: BorderSide(color: Colors.transparent),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ));
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
                      color: AppColors.Colorq.withOpacity(0.9),
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
                      child: Text(
                        " Or Continue With",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.font14,
                            fontWeight: FontWeight.w300),
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
                        style: GoogleFonts.poppins(
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
