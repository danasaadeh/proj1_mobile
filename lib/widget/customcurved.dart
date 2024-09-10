import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tourism/pages/favorite.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/mybooking.dart';
import 'package:tourism/pages/profile.dart';

/*class curvedNav extends StatefulWidget {
  @override
  State<curvedNav> createState() => _curvedNavState();
}

class _curvedNavState extends State<curvedNav> {
  int currentIndex = 0;
  int selectedindex = 0;
  late PageController _pageController;
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        animationDuration: Duration(microseconds: 300),
        animationCurve: Curves.decelerate,
        buttonBackgroundColor: Color(0XFF2C516C),
        color: Color.fromARGB(255, 74, 122, 152),
        backgroundColor: Colors.white,
        height: 57,
        items: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Homepage.id);
              },
              icon: Icon(Icons.home_rounded),
              iconSize: 30,
              color: Colors.white),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, favouritPage.id);
              },
              icon: Icon(Icons.favorite_rounded),
              iconSize: 30,
              color: Colors.white),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MyBooking.id);
              },
              icon: Icon(Icons.flight_outlined),
              iconSize: 30,
              color: Colors.white),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, profilePage.id);
              },
              icon: Icon(Icons.person),
              iconSize: 30,
              color: Colors.white),
        ],
        onTap: (val) {
          setState(() {
            selectedindex = val;
            _pageController.jumpToPage(val);
          });
        });
  }
}*/

// class Navigatorbar extends StatefulWidget {
//   const Navigatorbar({super.key});
//   static String id = 'Navigatorbar';
//   @override
//   State<Navigatorbar> createState() => _NavigatorbarState();
// }

// class _NavigatorbarState extends State<Navigatorbar> {
//   int currentIndex = 0;
//   int selectedindex = 0;
//   late PageController _pageController;
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }

//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//           // selectedItemColor:
//           //        Color.fromARGB(255, 15, 97, 164),
//           // currentIndex: selectedindex,

//           items: [
//             IconButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, Homepage.id);
//                 },
//                 icon: Icon(Icons.home_rounded),
//                 iconSize: 30,
//                 color: Colors.white),
//             IconButton(
//                 onPressed: () {
//                   // Navigator.pushNamed(context, favouritPage.id);
//                 },
//                 icon: Icon(Icons.favorite_rounded),
//                 iconSize: 30,
//                 color: Colors.white),
//             IconButton(
//                 onPressed: () {
//                   //   Navigator.pushNamed(context, MyBooking.id);
//                 },
//                 icon: Icon(Icons.flight_outlined),
//                 iconSize: 30,
//                 color: Colors.white),
//             IconButton(
//                 onPressed: () {
//                   //  Navigator.pushNamed(context, profilePage.id);
//                 },
//                 icon: Icon(Icons.person),
//                 iconSize: 30,
//                 color: Colors.white),
//           ],
//           height: 65.0,
//           color: Color.fromARGB(255, 8, 65, 111),
//           buttonBackgroundColor: Color.fromARGB(255, 8, 65, 111),
//           backgroundColor: Color.fromARGB(22, 255, 255, 255),
//           animationCurve: Curves.easeInOut,
//           animationDuration: Duration(milliseconds: 600),
//           onTap: (val) {
//             setState(() {
//               selectedindex = val;
//               _pageController.jumpToPage(val);
//             });
//           }),
//     );
//   }
// }

// class Navigatorbar extends StatefulWidget {
//   static String id = 'Navigatorbar';

//   const Navigatorbar({super.key});

//   @override
//   State<Navigatorbar> createState() => _NavigatorbarState();
// }

// class _NavigatorbarState extends State<Navigatorbar> {
//   // int currentIndex = 0;
//   int selectedindex = 0;
//   late PageController _pageController;

//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }

//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         children: <Widget>[
//           Homepage(),
//           favouritPage(),
//           MyBooking(),
//           profilePage(),
//         ],
//         // onPageChanged: (index) {
//         //   setState(() {
//         //     currentIndex = index;
//         //   });
//         // },
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         index: selectedindex,
//         items: [
//           IconButton(
//               onPressed: () {
//                 //  Navigator.pushNamed(context, Homepage.id);
//               },
//               icon: Icon(Icons.home_rounded),
//               iconSize: 30,
//               color: Colors.white),
//           IconButton(
//               onPressed: () {
//                 //  Navigator.pushNamed(context, favouritPage.id);
//               },
//               icon: Icon(Icons.favorite_rounded),
//               iconSize: 30,
//               color: Colors.white),
//           IconButton(
//               onPressed: () {
//                 //   Navigator.pushNamed(context, MyBooking.id);
//               },
//               icon: Icon(Icons.flight_outlined),
//               iconSize: 30,
//               color: Colors.white),
//           IconButton(
//               onPressed: () {
//                 //   Navigator.pushNamed(context, profilePage.id);
//               },
//               icon: Icon(Icons.person),
//               iconSize: 30,
//               color: Colors.white),
//         ],
//         height: 65.0,
//         color: Color.fromARGB(255, 8, 65, 111),
//         buttonBackgroundColor: Color.fromARGB(255, 8, 65, 111),
//         backgroundColor: Color.fromARGB(22, 255, 255, 255),
//         animationCurve: Curves.easeInOut,
//         animationDuration: Duration(milliseconds: 600),
//         onTap: (index) {
//           setState(() {
//             selectedindex = index;
//             _pageController.jumpToPage(index);
//           });
//         },
//       ),
//     );
//   }
// }
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List Screens = [
    Homepage(),
    favouritPage(),
    MyBooking(),
    profilePage(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(microseconds: 300),
        animationCurve: Curves.decelerate,
        buttonBackgroundColor: Color(0XFF2C516C),
        color: Color.fromARGB(255, 74, 122, 152),
        backgroundColor: Colors.white,
        height: 60,
        index: _selectedIndex,
        items: [
          Icon(Icons.home_rounded, size: 30, color: Colors.white),
          Icon(Icons.favorite_rounded, size: 30, color: Colors.white),
          Icon(Icons.flight_outlined, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Screens[_selectedIndex],
    );
  }
}
