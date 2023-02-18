import 'package:flutter/material.dart';
import 'package:ghaslah/unit/color_manager.dart';

import 'new/new_booking_screen.dart';
import 'old/old_booking_screen.dart';


class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.gradientColor2,
          title: const Text('Bookings'),
          bottom:   const TabBar(
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
