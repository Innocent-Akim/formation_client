import 'package:flutter/material.dart';
import 'package:formation_client/authentication/authentication.dart';
import 'package:formation_client/router/activity_navigator.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case authentifications:
      return _getPageRoute(AuthenticationPage());
    default:
      return null;
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
