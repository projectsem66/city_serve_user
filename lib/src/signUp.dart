import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            children: [
              Container(
                height: dimension.height80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blueAccent),
              ),
              SizedBox(
                height: dimension.height30,
              ),
              Text("Create Your Acoount"),
              SizedBox(
                height: dimension.height20,
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
                    labelText: "First Name",
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
                height: dimension.height12,
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
                    labelText: "Last Name",
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
                height: dimension.height12,
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
                    labelText: "E-mail",
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
                height: dimension.height12,
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
                    labelText: "Contact No",
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
                height: dimension.height12,
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
                height: dimension.height20,
              ),
              Container(
                height: dimension.height50,
                width: double.maxFinite,
                child: Center(
                  child: Text("Sign Up"),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
