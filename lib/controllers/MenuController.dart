import 'package:flutter/material.dart';
import 'package:formation_client/router/activity_navigator.dart';
import 'package:formation_client/router/routes.dart';
import 'package:get/get.dart';

import 'Const.dart';
import 'style.dart';


class MenuController extends ChangeNotifier {
  static MenuController instance = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openDrawer();
    }
  }

  var activeItem = authentifications.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;
  isActive(String itemName) => activeItem.value == itemName;


}

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }
  goBack() => navigatorKey.currentState.pop();
}

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  const CustomText({Key key, this.text, this.size, this.color, this.weight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.normal,),
    );
  }
}

Navigator localNavigator() => Navigator(

      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: authentifications,
    );
