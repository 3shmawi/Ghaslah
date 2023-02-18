import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../widgets/colors.dart';
import '../../widgets/single_car.dart';
import 'new_booking_screen.dart';
import 'old_booking_screen.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  late TabController _controller ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.gradientColor2,
          title: const Text('Bookings'),
          bottom:   TabBar(
            tabs: [
              Tab(text: "Current"),
              Tab(text: "Done"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OldBooking(),
            NewBooking(),
          ],
        ),
      ),
    );
  }
}
