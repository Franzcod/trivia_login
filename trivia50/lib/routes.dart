import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia50/src/screens/loading.dart';
import 'package:trivia50/src/screens/login.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/landing":
        return MaterialPageRoute(builder: (context) => LoadingPage());

      case "/signPage":
        return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }
}
