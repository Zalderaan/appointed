import 'package:flutter/material.dart';
import 'package:appointed_client/screens/home_screen.dart';
import 'package:appointed_client/screens/login_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => HomeScreen(),
      login: (context) => LoginScreen(),
    };
  }
}
