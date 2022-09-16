import 'package:flutter/material.dart';
import 'package:formation_client/controllers/MenuController.dart';
import 'package:formation_client/response/responsive.dart';
import 'package:formation_client/top_nav.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateBody();
  }
}

class _StateBody extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      appBar: topNavigationBar(
          context, context.read<MenuController>().scaffoldKey),
      // drawer: SideMenu(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // We want this side menu only for large screen
          if (Responsive.isDesktop(context))
            // Expanded(
            //   // default flex = 1
            //   // and it takes 1/6 part of the screen
            //   child: SideMenu(),
            // ),
          Expanded(
            // It takes 5/6 part of the screen
            flex: 5,
            child: localNavigator(),
          ),
        ],
      ),
    );
  }
}
