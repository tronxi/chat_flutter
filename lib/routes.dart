import 'package:chat_flutter/pages/join/join_page.dart';
import 'package:chat_flutter/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String loginPage = '/';
  static const String joinPage = '/join';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case joinPage:
        return MaterialPageRoute(
          builder: (_) => const JoinPage(),
        );
      default:
        throw const FormatException("Route not found");
    }
  }

}
