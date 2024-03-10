import 'package:city_serve/src/page/cartPages/confirmBooking.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../location/googleLocation.dart';

class AddressAndSlot extends StatefulWidget {
  const AddressAndSlot({super.key});

  @override
  State<AddressAndSlot> createState() => _AddressAndSlotState();
}

DateTime? selectedDate;
TimeOfDay? selectedTime;
String bookingAddress = "";

class _AddressAndSlotState extends State<AddressAndSlot> {
  bool isChecked = false;
  int selectedValue = 1;
  TextEditingController _addressController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(

      onDatePickerModeChange: (value) {
        setState(() {});
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024, 4),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      setState(() {});
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

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
        title: Text("Add Address & Slot"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Use Current Location",
                          style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: dimension.height10,
                        ),
                        RadioListTile(
                          activeColor: AppColors.Colorq,
                          title: Text(
                            currentLocation,
                            style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: dimension.height16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          value: 1,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: dimension.height10,
                        ),
                        Text(
                          "Type Manually Address",
                          style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        RadioListTile(
                          activeColor: AppColors.Colorq,
                          title: Container(
                            decoration: BoxDecoration(
                                color: AppColors.Colorq.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(7)),
                            child: TextFormField(
                              controller: _addressController,
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              maxLines: null,
                              minLines: 1,
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.height18,
                                  fontWeight: FontWeight.w400),
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText:
                                    "Flat no./ Residency/ Street/ Area/ City....",
                                hintStyle: GoogleFonts.poppins(
                                    color: AppColors.Colorq.withOpacity(0.5),
                                    fontSize: dimension.height14,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    EdgeInsets.fromLTRB(5, 10, 5, 0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.Colorq),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                          value: 2,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(dimension.height7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: dimension.height7,
                              ),
                              Text(
                                selectedDate == null
                                    ? 'Select Date'
                                    : '${DateFormat('dd-MM-yyyy').format(selectedDate!)}',
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: dimension.height18,
                                    fontWeight: FontWeight.w400),
                              ),
                              Bounce(
                                duration: Duration(milliseconds: 200),
                                onPressed: () {
                                  _selectDate(context);
                                },
                                child: Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: AppColors.Colorq,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 7),
                                    child: Center(
                                      child: Text(
                                        "Select Date",
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
                        SizedBox(height: 20),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(dimension.height7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: dimension.height7,
                              ),
                              Text(
                                selectedTime == null
                                    ? 'Select Time'
                                    : '${selectedTime!.format(context)}',
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: dimension.height18,
                                    fontWeight: FontWeight.w400),
                              ),
                              Bounce(
                                duration: Duration(milliseconds: 200),
                                onPressed: () {
                                  _selectTime(context);
                                },
                                child: Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: AppColors.Colorq,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 7),
                                    child: Center(
                                      child: Text(
                                        "Select Time",
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height100 * 2.6,
                ),
                Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    selectedValue == 1
                        ? bookingAddress = currentLocation
                        : bookingAddress = _addressController.text.toString();
                    if (bookingAddress == "") {
                      Get.snackbar("Enter required field", "Enter address",
                          colorText: Colors.white);
                    } else if (selectedDate == null && selectedTime == null) {
                      Get.snackbar("Enter required field", "Select Date & Time",
                          colorText: Colors.white);
                    } else {
                      Get.to(ConfirmBooking(),
                          transition: Transition.cupertino);
                    }
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
                          "Proceed",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: dimension.height18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
