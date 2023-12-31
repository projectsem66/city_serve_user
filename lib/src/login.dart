import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';

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
                  height: dimension.height40,
                ),
                Center(
                    child: Text(
                  "Login",
                  style: dimension.style30,
                )),
                SizedBox(
                  height: dimension.height35,
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Email Address",
                      labelStyle: dimension.style20,
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
                  color: Colors.grey.shade200,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Password",
                      labelStyle: dimension.style20,
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
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "Forgot Password? ",
                      style: dimension.style18,
                    ),
                  ],
                ),
                SizedBox(
                  height: dimension.height20,
                ),
                Container(
                  height: dimension.height50,
                  width: double.maxFinite,
                  child: Center(
                      child: Text(
                    "Sign In",
                    style: dimension.style20,
                  )),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
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
                      style: dimension.style15,
                    ),
                    Text(
                      "Sign up",
                      style: dimension.style15,
                    ),
                  ],
                )),
                SizedBox(
                  height: dimension.height25,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "   Or Continue With",
                        style: TextStyle(
                          color: Color(0xff222831),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.black,
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
                        width: dimension.width40,
                      ),
                      Text("Sign in with google")
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5)),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Container(
                  height: dimension.height50,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: dimension.height80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black12),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset("assets/logo/callLogo.png",
                                height: dimension.height50),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: dimension.width40,
                      ),
                      Text("Sign in with OTP")
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
