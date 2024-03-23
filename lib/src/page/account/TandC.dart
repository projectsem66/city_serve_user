import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/colors.dart';

class TandC extends StatefulWidget {
  const TandC({super.key});

  @override
  State<TandC> createState() => _TandCState();
}

class _TandCState extends State<TandC> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text(
          "Terms and Conditions",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: dimension.height22,
                fontWeight: FontWeight.w400)
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to City Serve, an on-demand service platform connecting users with local service providers for various tasks and services within your city. These terms and conditions govern your use of the City Serve platform and services. By accessing or using City Serve, you agree to comply with these terms and conditions. If you do not agree with any part of these terms, you may not use City Serve.\nCity Serve provides a platform that enables users to connect with local service providers offering a wide range of services, including but not limited to home maintenance, delivery services, transportation, and professional services. Users can browse available services, select service providers, and schedule appointments or request services as needed.\nAs a user of City Serve, you agree to provide accurate and up-to-date information when registering and using our platform. You are responsible for maintaining the confidentiality of your account credentials and are solely responsible for any activity that occurs under your account. You agree to comply with all applicable laws and regulations when using City Serve.\nAs a user of City Serve, you agree to provide accurate and up-to-date information when registering and using our platform. You are responsible for maintaining the confidentiality of your account credentials and are solely responsible for any activity that occurs under your account. You agree to comply with all applicable laws and regulations when using City Serve.\nUsers agree to pay the specified fees for services requested through City Serve. Service fees are determined based on factors such as the type of service, scope of work, duration, and any additional charges specified by the service provider. Users are responsible for reviewing and accepting the applicable fees before confirming a service request.\nAll intellectual property rights related to City Serve, including but not limited to trademarks, logos, content, and software, are owned by City Serve or its licensors. Users may not use, reproduce, modify, or distribute any content from City Serve without prior written consent from City Serve.\nCity Serve reserves the right to modify or amend these terms and conditions at any time without prior notice. Changes will be effective immediately upon posting on our platform. Users are encouraged to review these terms periodically for updates.\nIf you have any questions, concerns, or feedback regarding these terms and conditions or the use of City Serve, please contact us.",
                style: GoogleFonts.poppins(
                    color: AppColors.Colorq,
                    fontSize: dimension.height16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height:  15,),
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
            ],
          ),
        ),
      ),

    );
  }
}
