import 'package:city_serve/src/page/cartPages/summary.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../btm_controller.dart';
import '../../../utils/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

List cartDetails = [
  {"srvName": "Ac service & Repair", "srvPrice": "800"}
];

BtmController _ = Get.put(BtmController());
int _currentIndex1 = 0;

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex1 = 0;
                _.currentIndex = 0;
                _.update();
                print(_currentIndex1);
              });
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text("Your cart"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: screenheight() - dimension.height100 * 2,
                child: ListView.builder(
                  itemCount: cartDetails.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        // color: AppColors.Colorq.withOpacity(0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartDetails[index]["srvName"],
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.height20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "Price: ₹${cartDetails[index]["srvPrice"]}",
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.height18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                                AppColors.red.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            border: Border.all(
                                                color: AppColors.red)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          child: Text(
                                            "+     -",
                                            style: GoogleFonts.poppins(
                                                color: AppColors.red,
                                                fontSize: dimension.height14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: dimension.height100,
                                    width: dimension.height100,
                                    decoration: BoxDecoration(
                                        color:
                                            AppColors.Colorq.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(7),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/category/category_acc1.png"))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Bounce(
                duration: Duration(milliseconds: 200),
                onPressed: () {
                  Get.to(Summary(), transition: Transition.cupertino);
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.Colorq,
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    child: Center(
                      child: Text(
                        "Check Out",
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
    );
  }
}
