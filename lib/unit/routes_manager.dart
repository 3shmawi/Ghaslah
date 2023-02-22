import 'package:flutter/material.dart';
import 'package:ghaslah/unit/strings_manager.dart';

import '../screens/book_wash/book_wash_screen.dart';
import '../screens/main/main_screen.dart';

class Routes {
  static const splashRoute = "/";
  static const mainRoute = "/main";
  static const bookingWashRoute = "/bookingWash";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.bookingWashRoute:
        return MaterialPageRoute(builder: (_) => const BookingWashScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
