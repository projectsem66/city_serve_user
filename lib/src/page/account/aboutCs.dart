import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/colors.dart';

class AboutCS extends StatefulWidget {
  const AboutCS({super.key});

  @override
  State<AboutCS> createState() => _AboutCSState();
}

class _AboutCSState extends State<AboutCS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text(
          "About CS",
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
                "City Serve is your trusted on-demand home services platform, dedicated to simplifying your life by connecting you with reliable service providers for all your home service needs. Whether you need repairs, maintenance, installations, or upgrades for your home appliances, plumbing, electrical systems, HVAC, or any other area of your home, City Serve has you covered.\nAt City Serve, our mission is to provide homeowners with a convenient and reliable solution for all their home service needs. We strive to offer a seamless and hassle-free experience by connecting you with experienced and vetted service providers who deliver top-quality services and exceptional customer satisfaction.\nConvenience: With City Serve, accessing professional home services is as easy as a few taps on your device. Say goodbye to long wait times and endless phone calls – City Serve brings the service to you when you need it.\nReliability: We carefully vet all our service providers to ensure they meet our high standards of professionalism and expertise. You can trust that the service providers we connect you with are experienced, reliable, and committed to delivering excellent results.\nVariety: City Serve offers a wide range of home services to meet your diverse needs. Whether you need a quick repair, routine maintenance, or a complete installation, you'll find the right service provider for the job on City Serve.",
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
            ],
          ),
        ),
      ),
    );
  }
}
