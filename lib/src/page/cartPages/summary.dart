import 'package:city_serve/src/location/googleLocation.dart';
import 'package:city_serve/src/page/cartPages/addressAndSlot.dart';
import 'package:city_serve/src/page/serviceDescription.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}
String total = "";
int couponDis =20;
int itemPrice =0;

class _SummaryState extends State<Summary> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemPrice =int.parse(serviceDetailsSS?.get("servicePrice")) ;
  }


  bool isChecked = false;
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Get.back();
              });
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Summary"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // color: Colors.yellowAccent,
                  height: screenheight() - dimension.height100 * 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: dimension.height15,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.Colorq),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                  child: Icon(
                                Icons.percent,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          SizedBox(
                            width: dimension.height10,
                          ),
                          Text(
                            "Coupons and Offers",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height18,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.bottomSheet(
                                isDismissible: true,
                                Container(
                                  height: 285,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                ),
                              );
                            },
                            child: Text(
                              "Offers >",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: dimension.height30,
                      ),
                      Text(
                        "Payment Summary",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w600),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Item total",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height18,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "₹${itemPrice}",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Coupon discount",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height18,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "₹${couponDis}",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height18,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                           "₹${(itemPrice+couponDis).toString()}",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontSize: dimension.height18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: dimension.height30),
                      Text(
                        "Cancellation & Reschedule  Policy",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: dimension.height5,
                      ),
                      Text(
                        "Free cancellation if done more than 3 hrs before the service or if professional not provided",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height16,
                            fontWeight: FontWeight.w400),
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onPressed: () {
                          Get.bottomSheet(
                              isDismissible: true,
                              Container(
                                height: dimension.height100 * 2,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, right: 10, left: 10),
                                  child: Text(
                                    "You will be charged a cancellation fee if you cancel or reschedule your appointment without giving a minimum of 3 hrs notice prior to the start of the appointment. The cancellation fee will be up to 100 rs of the amount. Thank you! ",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.Colorq,
                                        fontSize: dimension.height16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ));
                        },
                        child: Text(
                          "Learn more",
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    total = (itemPrice+couponDis).toString();
                    Get.to(AddressAndSlot(),transition: Transition.cupertino);
                    // showModalBottomSheet(
                    //   isDismissible: true,
                    //   useSafeArea: true,
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     int selectedValue = 1;
                    //     return StatefulBuilder(
                    //
                    //
                    //       builder:
                    //           (BuildContext context, StateSetter setState) {
                    //         return Container(
                    //           height: dimension.height100 * 3,
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(10),
                    //                   topRight: Radius.circular(10))),
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //                 top: 20, right: 10, left: 10, bottom: 20),
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 RadioListTile(
                    //                   title: Text(
                    //                     currentLocation,
                    //                     style: GoogleFonts.poppins(
                    //                       color: AppColors.Colorq,
                    //                       fontSize: dimension.height16,
                    //                       fontWeight: FontWeight.w400,
                    //                     ),
                    //                   ),
                    //                   value: 1,
                    //                   groupValue: selectedValue,
                    //                   onChanged: (value) {
                    //                     setState(() {
                    //                       selectedValue = value!;
                    //                     });
                    //                   },
                    //                 ),
                    //                 RadioListTile(
                    //                   title: Container(
                    //                     decoration: BoxDecoration(
                    //                         color: AppColors.themColor
                    //                             .withOpacity(0.05),
                    //                         borderRadius:
                    //                             BorderRadius.circular(7)),
                    //                     child: TextFormField(
                    //                       // controller: _addressController,
                    //                       // maxLines: 2,
                    //                       cursorColor: Colors.black,
                    //                       style: TextStyle(
                    //                         fontSize: 18,
                    //                         color: Colors.black,
                    //                       ),
                    //                       // controller: passwordController,
                    //                       keyboardType: TextInputType.text,
                    //                       // obscureText: spwd,
                    //                       // obscureText: true,
                    //
                    //                       decoration: InputDecoration(
                    //                         hintText:
                    //                             "Flat no./ Residency/ Street/ Area/ City....",
                    //                         hintStyle: GoogleFonts.poppins(
                    //                             fontSize: dimension.height16,
                    //                             color: AppColors.Colorq
                    //                                 .withOpacity(0.5)),
                    //                         floatingLabelBehavior:
                    //                             FloatingLabelBehavior.always,
                    //                         labelStyle: TextStyle(
                    //                             color: AppColors.themColor),
                    //                         contentPadding: EdgeInsets.fromLTRB(
                    //                             5, 10, 5, 0),
                    //                         focusedBorder: OutlineInputBorder(
                    //                           borderSide: BorderSide(
                    //                               color: AppColors.themColor),
                    //                           borderRadius:
                    //                               BorderRadius.circular(5.0),
                    //                         ),
                    //                         enabledBorder: OutlineInputBorder(
                    //                           borderSide: BorderSide(
                    //                               color: Colors.transparent),
                    //                           borderRadius:
                    //                               BorderRadius.circular(5.0),
                    //                         ),
                    //                       ),
                    //                       validator: (value) {
                    //                         if (value!.isEmpty) {
                    //                           return 'Enter Address';
                    //                         }
                    //                         return null;
                    //                       },
                    //                     ),
                    //                   ),
                    //                   value: 2,
                    //                   groupValue: selectedValue,
                    //                   onChanged: (value) {
                    //                     setState(() {
                    //                       selectedValue = value!;
                    //                     });
                    //                   },
                    //                 ),
                    //                 SizedBox(
                    //                   height: dimension.height15,
                    //                 ),
                    //                 Spacer(),
                    //                 Bounce(
                    //                   duration: Duration(milliseconds: 200),
                    //                   onPressed: () {
                    //                     Navigator.pop(context);
                    //                     showModalBottomSheet(
                    //                       isDismissible: true,
                    //                       useSafeArea: true,
                    //                       context: context,
                    //                       builder: (BuildContext context) {
                    //                         int selectedValue = 1;
                    //                         return StatefulBuilder(
                    //
                    //
                    //                           builder:
                    //                               (BuildContext context, StateSetter setState) {
                    //                             return  Container(
                    //                               height: dimension.height100 * 3,
                    //                               decoration: BoxDecoration(
                    //                                   color: Colors.white,
                    //                                   borderRadius:
                    //                                   BorderRadius.only(
                    //                                       topLeft:
                    //                                       Radius.circular(
                    //                                           10),
                    //                                       topRight:
                    //                                       Radius.circular(
                    //                                           10))),
                    //                               child: Padding(
                    //                                 padding:  EdgeInsets.only(
                    //                                     top: 20,
                    //                                     right: 10,
                    //                                     left: 10,
                    //                                     bottom: 20),
                    //                                 child: Column(
                    //                                   crossAxisAlignment:
                    //                                   CrossAxisAlignment.center,
                    //                                   children: [
                    //                                     Text(
                    //                                       selectedDate == null
                    //                                           ? 'No date selected'
                    //                                           : 'Selected Date: ${DateFormat('dd-MM-yyyy').format(selectedDate!)}',
                    //                                       style:
                    //                                       GoogleFonts.poppins(
                    //                                           color: AppColors
                    //                                               .Colorq,
                    //                                           fontSize:
                    //                                           dimension
                    //                                               .height18,
                    //                                           fontWeight:
                    //                                           FontWeight
                    //                                               .w400),
                    //                                     ),
                    //                                     SizedBox(height: 10),
                    //                                     Bounce(
                    //                                       duration: Duration(
                    //                                           milliseconds: 200),
                    //                                       onPressed: () {
                    //                                         _selectDate(context);
                    //                                       },
                    //                                       child: Container(
                    //                                         width: 150,
                    //                                         decoration: BoxDecoration(
                    //                                             color: AppColors
                    //                                                 .Colorq,
                    //                                             borderRadius:
                    //                                             BorderRadius
                    //                                                 .circular(
                    //                                                 7)),
                    //                                         child: Padding(
                    //                                           padding: EdgeInsets
                    //                                               .symmetric(
                    //                                               vertical: 10,
                    //                                               horizontal:
                    //                                               7),
                    //                                           child: Center(
                    //                                             child: Text(
                    //                                               "Select Date",
                    //                                               style: GoogleFonts.poppins(
                    //                                                   color: Colors
                    //                                                       .white,
                    //                                                   fontSize:
                    //                                                   dimension
                    //                                                       .height18,
                    //                                                   fontWeight:
                    //                                                   FontWeight
                    //                                                       .w400),
                    //                                             ),
                    //                                           ),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                     SizedBox(height: 20),
                    //                                     Text(
                    //                                       selectedTime == null
                    //                                           ? 'No time selected'
                    //                                           : 'Selected Time: ${selectedTime!.format(context)}',
                    //                                       style:
                    //                                       GoogleFonts.poppins(
                    //                                           color: AppColors
                    //                                               .Colorq,
                    //                                           fontSize:
                    //                                           dimension
                    //                                               .height18,
                    //                                           fontWeight:
                    //                                           FontWeight
                    //                                               .w400),
                    //                                     ),
                    //                                     SizedBox(height: 10),
                    //                                     Bounce(
                    //                                       duration: Duration(
                    //                                           milliseconds: 200),
                    //                                       onPressed: () {
                    //                                         _selectTime(context);
                    //                                       },
                    //                                       child: Container(
                    //                                         width: 150,
                    //                                         decoration: BoxDecoration(
                    //                                             color: AppColors
                    //                                                 .Colorq,
                    //                                             borderRadius:
                    //                                             BorderRadius
                    //                                                 .circular(
                    //                                                 7)),
                    //                                         child: Padding(
                    //                                           padding: EdgeInsets
                    //                                               .symmetric(
                    //                                               vertical: 10,
                    //                                               horizontal:
                    //                                               7),
                    //                                           child: Center(
                    //                                             child: Text(
                    //                                               "Select Time",
                    //                                               style: GoogleFonts.poppins(
                    //                                                   color: Colors
                    //                                                       .white,
                    //                                                   fontSize:
                    //                                                   dimension
                    //                                                       .height18,
                    //                                                   fontWeight:
                    //                                                   FontWeight
                    //                                                       .w400),
                    //                                             ),
                    //                                           ),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                     Spacer(),
                    //                                     Bounce(
                    //                                       duration: Duration(
                    //                                           milliseconds: 200),
                    //                                       onPressed: () {
                    //
                    //                                       },
                    //                                       child: Container(
                    //                                         width: double.maxFinite,
                    //                                         decoration: BoxDecoration(
                    //                                             color: AppColors
                    //                                                 .Colorq,
                    //                                             borderRadius:
                    //                                             BorderRadius
                    //                                                 .circular(
                    //                                                 7)),
                    //                                         child: Padding(
                    //                                           padding: EdgeInsets
                    //                                               .symmetric(
                    //                                               vertical: 10,
                    //                                               horizontal:
                    //                                               7),
                    //                                           child: Center(
                    //                                             child: Text(
                    //                                               "Proceed to checkout",
                    //                                               style: GoogleFonts.poppins(
                    //                                                   color: Colors
                    //                                                       .white,
                    //                                                   fontSize:
                    //                                                   dimension
                    //                                                       .height18,
                    //                                                   fontWeight:
                    //                                                   FontWeight
                    //                                                       .w400),
                    //                                             ),
                    //                                           ),
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                               ),
                    //                             );
                    //                           },
                    //                         );
                    //                       },
                    //                     );
                    //
                    //                   },
                    //                   child: Container(
                    //                     width: double.maxFinite,
                    //                     decoration: BoxDecoration(
                    //                         color: AppColors.Colorq,
                    //                         borderRadius:
                    //                             BorderRadius.circular(7)),
                    //                     child: Padding(
                    //                       padding: EdgeInsets.symmetric(
                    //                           vertical: 10, horizontal: 7),
                    //                       child: Center(
                    //                         child: Text(
                    //                           "Proceed",
                    //                           style: GoogleFonts.poppins(
                    //                               color: Colors.white,
                    //                               fontSize: dimension.height18,
                    //                               fontWeight: FontWeight.w400),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    // );
                    // setState(() {
                    //
                    // });
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.Colorq,
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                      child: Center(
                        child: Text(
                          "Add Address & Slot",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w400),
                        ),
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
