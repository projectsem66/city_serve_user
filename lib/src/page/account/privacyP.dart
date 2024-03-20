import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class PrivacyP extends StatefulWidget {
  const PrivacyP({super.key});

  @override
  State<PrivacyP> createState() => _PrivacyPState();
}

class _PrivacyPState extends State<PrivacyP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text(
          "Privacy Policy",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to City Serve! Your privacy is important to us, and we are committed to protecting your personal information when you use our on-demand service\nWhen you use City Serve, we may collect personal information such as your name, email address, phone number, and payment details. We also gather usage information to understand how you use our service and device information to ensure security and optimize your experience.\nWe use your personal information to provide and improve our service, process transactions, and communicate with you about your account and service requests. Your usage information helps us analyze trends and personalize your experience, while device information helps us maintain security and compliance.\nWe may share your personal information with service providers to facilitate the delivery of services you request through City Serve. We may also share your information with third-party service providers who assist us in operating our service, processing payments, or providing customer support.\nYou can choose not to provide certain personal information, but this may limit your ability to use certain features of our service. You can also update or delete your personal information by accessing your account settings or contacting us.\nWe take reasonable measures to protect your personal information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is completely secure, so we cannot guarantee absolute security.\nCity Serve is not intended for children under the age of 13, and we do not knowingly collect personal information from children under 13. If you believe that your child has provided personal information to us, please contact us.\nWe may update this Privacy Policy from time to time, and any changes will be posted on this page. The revised version will be effective immediately upon posting.",
                style: GoogleFonts.poppins(
                    color: AppColors.Colorq,
                    fontSize: dimension.height16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "CONTACT US :",
                style: GoogleFonts.poppins(
                    color: AppColors.Colorq,
                    fontSize: dimension.height16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please feel free to contact us with any comments, questions ot suggestions. You might have regarding the Information described in the applications. ",
                style: GoogleFonts.poppins(
                    color: AppColors.Colorq,
                    fontSize: dimension.height16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "You may contact us at :",
                style: GoogleFonts.poppins(
                    color: AppColors.Colorq,
                    fontSize: dimension.height16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "City Serve,\nOffice no 1003 to 1007, B wing, \nBehind Royal Palace, \nVip road, Vesu (South west) \nSurat - 395007",
                style: GoogleFonts.poppins(
                    color: AppColors.Colorq,
                    fontSize: dimension.height16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "E-mail id : projectsem66@gmail.com",
                style: GoogleFonts.poppins(
                    color: AppColors.Colorq,
                    fontSize: dimension.height16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
