import 'dart:developer';
import 'dart:io';

import 'package:city_serve/src/location/googleLocation.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/colors.dart';
import 'otp_page.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

final _fnamecon = TextEditingController();
final _lnamecon = TextEditingController();
final _emailcon = TextEditingController();
final _monocon = TextEditingController();

class _SignUp2State extends State<SignUp2> {
  File? pickedImage;
  bool spwd = true;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  // void signup() {
  //   setState(() {
  //     loading = true;
  //   });
  //   _auth
  //       .createUserWithEmailAndPassword(
  //           email: _emailcon.text.toString(),
  //           password: _passwordcon.text.toString())
  //       .then((value) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => GoogleLocation()));
  //     setState(() {
  //       loading = false;
  //     });
  //   }).onError((error, stackTrace) {
  //     Utils().tostmessage(error.toString());
  //     setState(() {
  //       loading = false;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _emailcon.dispose();
  //   _passwordcon.dispose();
  // }

  showAlertBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pick Image From"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  pickImage(ImageSource.camera);
                  Get.back();
                },
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
              ),
              ListTile(
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Get.back();
                },
                leading: Icon(Icons.image),
                title: Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );
  }

  addUserData(String cName) async {
    if (cName == null && pickedImage == null) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter Required Field"),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Ok")),
            ],
          );
        },
      );
    } else {
      uploadData();
    }
  }

  uploadData() async {
    UploadTask uploadtask = FirebaseStorage.instance
        .ref("userimg")
        .child("${_monocon.text}")
        .putFile(pickedImage!, SettableMetadata(contentType: 'image/jpeg'));
    TaskSnapshot taskSnapshot = await uploadtask;
    String url = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance.collection("userDetails").doc(MonoAuthUid).set({
      "fname": _fnamecon.text.toString(),
      "uimage": url,
      "lname": _lnamecon.text.toString(),
      "emailid": _emailcon.text.toString(),
      "mono": _monocon.text.toString(),
    }).then((value) {
      log("User Uploaded");
      Get.to(GoogleLocation());
    });
    // await _collectionReference
    //     .doc(_cname.toString())
    //     .set({"cname": _cname.text.toString(), "cimage": url}).then(
    //   (value) {
    //     print("data Added");
    //   },
    // );
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
                GestureDetector(
                  onTap: () {
                    showAlertBox();
                  },
                  child: Stack(
                    children: [
                      pickedImage != null
                          ? Container(
                              height: dimension.height60 * 2,
                              width: dimension.height60 * 2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(pickedImage!),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq.withOpacity(0.05)),
                            )
                          : Container(
                              height: dimension.height60 * 2,
                              width: dimension.height60 * 2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("images/addCategoryy.png"),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq.withOpacity(0.05)),
                            ),
                      Container(
                        margin: EdgeInsets.only(
                            top: dimension.height65, left: dimension.height80),
                        height: dimension.height50,
                        width: dimension.height50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //   color: AppColors.Colorq
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            size: dimension.icon30,
                            Icons.camera_enhance,
                            color: AppColors.Colorq,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                            controller: _fnamecon,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter First Name';
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
                            controller: _lnamecon,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Last Name';
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
                            controller: _emailcon,
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
                                return 'Enter Email Address';
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
                            controller: _monocon,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Mobile Number';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: dimension.height20,
                        ),
                      ],
                    )),
                SizedBox(
                  height: dimension.height20,
                ),
                Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // signup();
                      addUserData(_fnamecon.text.toString());
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

  pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) {
        return;
      }
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
    } catch (ex) {
      log(ex.toString());
      print(ex.toString());
    }
  }
}
