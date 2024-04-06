import 'dart:async';

import 'package:city_serve/src/page/serviceDescription.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  String searchtxt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        centerTitle: false,
        title: Text(
          "Search",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.Colorq.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(7)),
              child: TextFormField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                onChanged: (value) {
                  searchtxt = value;
                  setState(() {});
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: AppColors.Colorq,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.Colorq),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: (searchtxt != "" && searchtxt != null)
                    ? FirebaseFirestore.instance
                        .collection("providerServiceDetails")
                        .where("serviceName", isNotEqualTo: searchtxt)
                        .orderBy("serviceName")
                        .startAt([searchtxt]).endAt(
                            [searchtxt + '\uf8ff']).snapshots()
                    : FirebaseFirestore.instance
                        .collection("providerServiceDetails")
                        .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          return Bounce(
                            duration: Duration(milliseconds: 200),
                            onPressed: () {
                              Get.to(
                                  ServiceDescription(serviceId: document.id));
                            },
                            child: ListTile(
                              title: Text(document['serviceName']),
                              subtitle: Text(
                                  "${document['subcategory']} > ${document['section']}"),
                              // Other UI components...
                            ),
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> searchItems(String query) async {
    QuerySnapshot snapshot = await _firestore
        .collection('providerServiceDetails')
        .where('serviceName', isEqualTo: query)
        .get();
    return snapshot.docs;
  }
}
