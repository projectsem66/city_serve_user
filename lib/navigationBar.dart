import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:friends/profile/Profile_page.dart';

import 'discover.dart';
import 'friendzy.dart';
import 'matches.dart';
import 'message.dart';

// List pages = [
//   DiscoverPage(),
//   matches(),
//   message(),
// ];
final btmNaviScr = [
  FriendzyPage(),
  message(),
  const matches(),
  DiscoverPage(),
  profile_page(),
];
int _currentIndex = 2;

class NavigationBarr extends StatefulWidget {
  NavigationBarr({super.key});

  @override
  State<NavigationBarr> createState() => _NavigationBarrState();
}

class _NavigationBarrState extends State<NavigationBarr> {
  // const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: btmNaviScr[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          height: 51,
          index: _currentIndex,
          // index: items[Index],
          // onTap: (value) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => pages[value]),
          //   );
          // },
          color: Color(0xffDD88CF),
          backgroundColor: Colors.transparent,
          animationDuration: Duration(milliseconds: 240),
          buttonBackgroundColor: Color(0xcc4B164C),
          animationCurve: Curves.easeOutExpo,
          items: [
            // Icon(Icons.home_filled,color: Colors.white),

            Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            Icon(
              Icons.message,
              color: Colors.white,
            ),
            Icon(
              Icons.call,
              color: Colors.white,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ]),
    );
  }
}
