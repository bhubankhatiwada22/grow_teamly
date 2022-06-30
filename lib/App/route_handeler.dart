import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tiktaktoe/App/route_app.dart';
import 'package:tiktaktoe/features/daily_update/views/add_daily_update.dart';
import 'package:tiktaktoe/homepage.dart';
import 'package:tiktaktoe/loginpage.dart';
import 'package:tiktaktoe/models/dummy_page_model.dart';

import '../pages/dummy_page.dart';

class RouteHandeler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (context) => const Homepage());
      case AppRoutes.dummyRoute:
        return MaterialPageRoute(
            builder: (context) => DummyPage(
                  data: arguments as DummyPageModel,
                ));
      case AppRoutes.addDailyUpdateRoute:
        return MaterialPageRoute(
            builder: (context) => const AddDailyUpdateView());
      
      default:
        return MaterialPageRoute(builder: (context) => const LoginPage());
    }
  }
}
