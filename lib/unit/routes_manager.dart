import 'package:flutter/material.dart';
import 'package:ghaslah/screens/profile/profile_obj.dart';
import 'package:ghaslah/unit/strings_manager.dart';

import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/book_wash/book_wash_screen.dart';
import '../screens/main/main_screen.dart';

class Routes {
  static const splashRoute = "/";
  static const mainRoute = "/main";
  static const bookingWashRoute = "/bookingWash";
  static const profileScreen = "/profile";
  static const otp = "/otp";
  static const  registerRoute = "/register";
  static const loginScreen = "/login";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.bookingWashRoute:
        return MaterialPageRoute(builder: (_) => const BookingWashScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen() );
      case Routes.otp:
        return MaterialPageRoute(builder: (_) =>  OTPScreen());
      case Routes.loginScreen :
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.registerRoute :
        return MaterialPageRoute(builder: (_)=> RegisterScreen());

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
