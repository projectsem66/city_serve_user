import 'package:city_serve/src/page/serviceDescription.dart';
import 'package:city_serve/utils/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final CollectionReference _servicesCollection =
      FirebaseFirestore.instance.collection('providerServiceDetails');
  List<DocumentSnapshot> _searchResults = [];

  void _searchServices(String query) {
    _servicesCollection
        .where('serviceName', isGreaterThanOrEqualTo: query)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        _searchResults = querySnapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.Colorq.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(7)),
              child: TextFormField(
                controller: _searchController,
                autofocus: true,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                onChanged: (query) {
                  _searchServices(query);
                },
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _searchServices(_searchController.text);
                    },
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Search here..",
                  hintStyle: GoogleFonts.poppins(
                      color: AppColors.Colorq,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                  contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.Colorq),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.Colorq.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            _searchResults.isEmpty
                ? Center(
                    child: Text('No services found.'),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        var serviceData = _searchResults[index].data()
                            as Map<String, dynamic>;
                        return Bounce(
                          duration: Duration(milliseconds: 200),
                          onPressed: () {
                            Get.to(ServiceDescription(
                                serviceId: _searchResults[index].id));
                          },
                          child: ListTile(
                            title: Text(serviceData['serviceName']),
                            subtitle: Text(serviceData['serviceDescription']),
                            // Add more UI components as needed based on your service data
                          ),
                        );
                      },
                    ),
                  ),
            SizedBox(height: 10),
            // Text(
            //   "Trending search",
            //   style: GoogleFonts.poppins(
            //       color: AppColors.Colorq,
            //       fontSize: dimension.height15,
            //       fontWeight: FontWeight.w300),
            // ),
            // SizedBox(height: 10),
            // Wrap(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //             color: AppColors.Colorq.withOpacity(0.1),
            //             borderRadius: BorderRadius.circular(5)),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Icon(
            //                 Icons.trending_up,
            //                 color: AppColors.Colorq,
            //                 size: 18,
            //               ),
            //               SizedBox(
            //                 width: 7,
            //               ),
            //               Text(
            //                 "Plumber",
            //                 style: GoogleFonts.poppins(),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //             color: AppColors.Colorq.withOpacity(0.1),
            //             borderRadius: BorderRadius.circular(5)),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Icon(
            //                 Icons.trending_up,
            //                 color: AppColors.Colorq,
            //                 size: 18,
            //               ),
            //               SizedBox(
            //                 width: 7,
            //               ),
            //               Text(
            //                 "Hair Artist",
            //                 style: GoogleFonts.poppins(),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //             color: AppColors.Colorq.withOpacity(0.1),
            //             borderRadius: BorderRadius.circular(5)),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Icon(
            //                 Icons.trending_up,
            //                 color: AppColors.Colorq,
            //                 size: 18,
            //               ),
            //               SizedBox(
            //                 width: 7,
            //               ),
            //               Text(
            //                 "Painter",
            //                 style: GoogleFonts.poppins(),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //             color: AppColors.Colorq.withOpacity(0.1),
            //             borderRadius: BorderRadius.circular(5)),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Icon(
            //                 Icons.trending_up,
            //                 color: AppColors.Colorq,
            //                 size: 18,
            //               ),
            //               SizedBox(
            //                 width: 7,
            //               ),
            //               Text(
            //                 "Electrician",
            //                 style: GoogleFonts.poppins(),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //             color: AppColors.Colorq.withOpacity(0.1),
            //             borderRadius: BorderRadius.circular(5)),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Icon(
            //                 Icons.trending_up,
            //                 color: AppColors.Colorq,
            //                 size: 18,
            //               ),
            //               SizedBox(
            //                 width: 7,
            //               ),
            //               Text(
            //                 "Carpenter",
            //                 style: GoogleFonts.poppins(),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      )),
    );
  }
}
