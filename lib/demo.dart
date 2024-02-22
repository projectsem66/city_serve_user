import 'package:flutter/material.dart';


class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  List bookingname = [
    'Ceiling and Wall Cleaning',
    'Custom Frame Painting',
    'Ac installation'
  ];
  List bookingprice = ['1300', '1800', '3500'];
  List bookingnum = ['#270', '#269', '#268'];
  List timedate = [
    '3 jan, 2024 At 12:00 Am',
    '6 jan, 2024 At 03:00 Pm',
    '4 jan, 2024 At 02:25 Pm'
  ];
  List helper = [
    'assets/images/helper1.jpg',
    'assets/images/helper2.jpg',
    'assets/images/helper3.jpg'
  ];
  List providernamee = ['Jorge Perez', 'Daniel Wiliams', 'jennifer Davis'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height:780,
      width: double.maxFinite,
      child: Padding(
        padding:  EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: 3,
          //  scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(left:15, right: 15),
              child: Padding(
                padding:  EdgeInsets.only(bottom:20),
                child: Container(height: 260,
                  width: double.maxFinite,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black45)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 18, left: 15),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                //color: Colors.green,
                                image: DecorationImage(
                                    image: AssetImage(helper[index]),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 32,
                                      width: 85,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.red.shade100),
                                      child: Center(
                                          child: Text("Pending",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15))),
                                    ),
                                    SizedBox(
                                      width:60,
                                    ),
                                    Text(
                                      bookingnum[index],
                                      style: TextStyle(
                                          color: Colors.cyanAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize:15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:7,
                                ),
                                Text(
                                  bookingname[index],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  bookingprice[index],
                                  style: TextStyle(
                                      color:  Colors.cyanAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(
                            left: 15, right: 15, top: 15),
                        child: Container(
                          height: 110,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffefeff7)),
                          child: Padding(
                            padding:  EdgeInsets.only(
                                top: 15, left: 15, right: 15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date & Time',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      timedate[index],
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Provider',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      providernamee[index],
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Customer Name',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      'Pedro Norris',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}