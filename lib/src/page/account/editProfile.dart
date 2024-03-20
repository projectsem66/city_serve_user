import 'dart:developer';
import 'dart:io';

import 'package:city_serve/src/authentication/otp_page.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/colors.dart';
import '../../../utils/round_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

// String currentUserId = FirebaseAuth.instance.currentUser!.uid;

class _EditProfileState extends State<EditProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? profileImageUrl;
  File? pickedImage;

  @override
  void initState() {
    super.initState();
    print(auth.currentUser?.uid);
    // Call a method to fetch user data from Firestore
    fetchUserData();
  }

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
                  Navigator.pop(context);
                },
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
              ),
              ListTile(
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context);
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

  Future<void> updateProfileImageUrl(String imageUrl) async {
    try {
      if (auth.currentUser?.uid == null) {
        throw Exception('User not logged in');
      }
      await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(auth.currentUser?.uid)
          .update({'uimage': imageUrl});
      setState(() {
        profileImageUrl = imageUrl;
      });
    } catch (error) {
      print('Error updating profile image URL: $error');
    }
  }
  String userPicUrl="";
  Future<String?> uploadImage() async {
    try {
      if (pickedImage != null) {
        String id = FirebaseAuth.instance.currentUser!.uid;
        UploadTask uploadTask = FirebaseStorage.instance
            .ref("userProfilePics")
            .child(id.toString())
            .putFile(
                pickedImage!,
                SettableMetadata(
                  contentType: 'image/jpeg',
                  customMetadata: {'picked-file-path': pickedImage!.path},
                ));
        TaskSnapshot taskSnapshot = await uploadTask;
         userPicUrl = await taskSnapshot.ref.getDownloadURL();
        return userPicUrl;
      }
    } catch (error) {
      print('Error uploading image: $error');
    }
    return null;
  }

  // Method to fetch user data from Firestore
  void fetchUserData() async {
    try {
      if (auth.currentUser?.uid == null) {
        throw Exception('User not logged in');
      }
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(auth.currentUser?.uid)
          .get();
      if (userData.exists) {
        setState(() {
          firstNameController.text = userData['fname'];
          lastNameController.text = userData['lname'];
          emailController.text = userData['emailid'];
          phoneController.text = userData['mono'];
          profileImageUrl = userData['uimage'];
        });
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  Future<void> updateUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('User not logged in');
      }
      final String providerId = currentUser.uid;

      // Update user data in Firestore
      await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(auth.currentUser?.uid)
          .update({
        'fname': firstNameController.text,
        'lname': lastNameController.text,
        'emailid': emailController.text,
        'mono': phoneController.text,
      });


    } catch (error) {
      print('Error updating user data: $error');
      throw error;
    }
  }

  Future<void> updateUserProfile() async {
    try {
      // Update user profile data in Firestore


      // Upload the picked image to Firebase Storage
      String? imageUrl = await uploadImage();

      // Update the profile image URL in Firestore
      if (imageUrl != null) {
        await updateProfileImageUrl(imageUrl);
      }
    } catch (error) {
      print('Error updating user profile: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Get.back();
              });
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Edit Profile"),
      ),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 50),
            Center(
              child: Bounce(
                onPressed: () {
                  showAlertBox();

                },
                duration: Duration(milliseconds: 200),
                child: Stack(
                  children: [

                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                            .withOpacity(0.2), // Change color as needed
                      ),
                      child: Center(
                        child: pickedImage != null || profileImageUrl != null
                            ? Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: pickedImage != null
                                        ? FileImage(pickedImage!)
                                        : (profileImageUrl != null
                                            ? NetworkImage(profileImageUrl!)
                                            : AssetImage(
                                                    'assets/image/profile.png')
                                                as ImageProvider<Object>),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Icon(
                                Icons.account_circle,
                                size: 120,
                                color: Colors.grey
                                    .withOpacity(0.5), // Change color as needed
                              ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 65, left: 80),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_enhance,
                        size: 30,
                        color: AppColors.Colorq, // Change color as needed
                      ),
                    ),
                  ],
                ),
              ),
            ),


            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First name text field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    // Change color as needed
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.Colorq, // Change color as needed
                    ),
                    controller: firstNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person_outline,
                        color: AppColors.Colorq, // Change color as needed
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "First Name",
                      labelStyle: TextStyle(color: AppColors.Colorq),
                      // Change color as needed
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
                        // Change color as needed
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Last name text field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    // Change color as needed
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.Colorq, // Change color as needed
                    ),
                    controller: lastNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person_outline,
                        color: AppColors.Colorq, // Change color as needed
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Last Name",
                      labelStyle: TextStyle(color: AppColors.Colorq),
                      // Change color as needed
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
                        // Change color as needed
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Email text field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    // Change color as needed
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.Colorq, // Change color as needed
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: AppColors.Colorq, // Change color as needed
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Email",
                      labelStyle: TextStyle(color: AppColors.Colorq),
                      // Change color as needed
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
                        // Change color as needed
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Phone number text field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    // Change color as needed
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: TextFormField(
                    controller: phoneController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.Colorq, // Change color as needed
                    ),
                    // keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.call_outlined,
                        color: AppColors.Colorq, // Change color as needed
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Phone Number",
                      hintStyle: TextStyle(
                        color: AppColors.Colorq.withOpacity(0.5),
                        // Change color as needed
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      hintText: " Example : +91 2356897410",
                      labelStyle: TextStyle(color: AppColors.Colorq),
                      // Change color as needed
                      contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.Colorq),
                        // Change color as needed
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () async{
                    await updateUserData();
                    Get.back();
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
                        "Update",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ]),
        ),
      ),
    ));
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

      String? imageUrl = await uploadImage();
      if (imageUrl != null) {
        await updateProfileImageUrl(imageUrl);
      }

    } catch (ex) {
      log(ex.toString());
      print(ex.toString());
    }
  }
}
