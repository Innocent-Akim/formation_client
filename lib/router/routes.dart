import 'package:flutter/material.dart';
import 'package:formation_client/authentication/authentication.dart';
import 'package:formation_client/home/home.dart';
import 'package:formation_client/learning/loarning.dart';
import 'package:formation_client/router/activity_navigator.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case authentifications:
      return _getPageRoute(AuthenticationPage());
    case home:
      return _getPageRoute(Home());
    case learnig:
      return _getPageRoute(Loarding());
    default:
      return null;
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
