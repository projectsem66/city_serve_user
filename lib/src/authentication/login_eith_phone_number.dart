import 'package:city_serve/utils/dimension.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/round_button.dart';
import '../../utils/colors.dart';
import '../../utils/util.dart';
import 'otp_page.dart';
import 'verify_code.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}
String authMoNo = "";
class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  bool  loading = false;
  final phoneNumberController = TextEditingController();
  final auth =FirebaseAuth.instance;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),

              Text(
                "Enter your mobile number to proceed",
                style: GoogleFonts.poppins(
                    color: AppColors.Colorq,
                    fontSize: dimension.height16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: AppColors.Colorq,
                  controller: phoneNumberController,
                  style:  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.Colorq,
                  ),
                  onChanged: (value) {
                    setState(() {
                      phoneNumberController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    // fillColor: const Color(0xff2C474A),
                    // filled: true,
                    hintText: "Mobile number",

                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.Colorq.withOpacity(0.9),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide:
                        BorderSide(color: AppColors.Colorq,width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: BorderSide(color: AppColors.Colorq.withOpacity(0.7))),
                    // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                    // focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: const CountryListThemeData(
                                bottomSheetHeight: 550,
                              ),
                              onSelect: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.Colorq,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: phoneNumberController.text.length > 9
                        ? Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                        : null,
                  ),
                ),
              ),
              // TextFormField(
              //   controller: phoneNumberController,
              //   keyboardType: TextInputType.phone,
              //   decoration:InputDecoration(
              //     hintText: '+1 234 3455 234'
              //   ),
              // ),
              SizedBox(
                height: 25,
              ),
              RoundButton(title: "Login",
                loding: loading,
                onTap: () {
                  authMoNo = phoneNumberController.text.toString();
                setState(() {
                  loading = true;
                });
                print("+"+selectedCountry.phoneCode+phoneNumberController.text);
                auth.verifyPhoneNumber(
                  phoneNumber: "+"+selectedCountry.phoneCode+phoneNumberController.text,
                    verificationCompleted: (_){
                      setState(() {
                        loading = false;
                      });
                    },
                    verificationFailed: (e){
                    Utils().tostmessage(e.toString());
                    },
                    codeSent: (String verificationId,int? token){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OtpPage(verificatioId: verificationId,)));
                    setState(() {
                      loading = false;
                    });
                    },
                    codeAutoRetrievalTimeout: (e){
                    Utils().tostmessage(e.toString());
                    setState(() {
                      loading = false;
                    });
                    });
              },)
            ],
          ),
        ),
      ),
    );
  }
}
