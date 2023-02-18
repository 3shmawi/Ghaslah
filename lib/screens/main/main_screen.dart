import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghaslah/screens/main/pages/booking/booking_page.dart';
import 'package:ghaslah/screens/main/pages/gifts/gifts_screen.dart';
import 'package:ghaslah/screens/main/pages/profile/profile_page.dart';
import 'package:ghaslah/screens/main/pages/store/car_store_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../unit/color_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List _listPages = <Widget>[
    const CarStorePage(),
    const BookingPage(),
    const GiftsScreen(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorManager.backgroundColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(
          18.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            50.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 1.0,
              blurRadius: 8.0,
              offset: const Offset(
                1,
                1,
              ),
            ),
          ],
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35.0),
          child: GNav(
            gap: 13.0,
            backgroundColor: Colors.white,
            tabBorderRadius: 40.0,
            tabBackgroundColor: ColorManager.pinkAccentColor,
            activeColor: ColorManager.redCircleColor,
            color: Colors.black.withOpacity(0.55),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: FontAwesomeIcons.store,
                text: "Home",
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 15.0,
                  bottom: 15.0,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.calendar,
                text: "bookings",
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 15.0,
                  bottom: 15.0,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.gift,
                text: "Gifts",
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 15.0,
                  bottom: 15.0,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.circleUser,
                text: "Profile",
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 15.0,
                  bottom: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _listPages.elementAt(_selectedIndex),
    );
  }
}
