import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_client/app/authentificate/bloc/authenticate_bloc.dart';
import 'package:formation_client/app/cours/cours_bloc.dart';
import 'package:formation_client/constants.dart';
import 'package:formation_client/router/activity_navigator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transition;
import '404/error.dart';
import 'app/identifications/bloc/identification_bloc.dart';
import 'authentication/authentication.dart';
import 'controllers/MenuController.dart';
import 'learning/loarning.dart';
import 'main/main_screen.dart';

void main() {
  Get.put(NavigationController());
  Get.put(MenuController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IdentificationBloc()),
        BlocProvider(create: (context) => AuthenticateBloc()),
        BlocProvider(create: (context) => CoursBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuController()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: authentifications,
          unknownRoute: GetPage(
            name: '/not-found',
            page: () => PageNotFound(),
            transition: transition.Transition.fadeIn,
          ),
          getPages: [
            GetPage(name: home, page: () => MainScreen()),
            GetPage(name: learnig, page: () => Loarding()),
            GetPage(
              name: authentifications,
              page: () => AuthenticationPage(),
            ),
          ],
          title: "FORMATION EN LIGNE",
          theme: ThemeData(fontFamily: AppConst.getInstance.primaryFont)
            ..copyWith(
              scaffoldBackgroundColor: bgWhite,
              canvasColor: bgWhite,
              pageTransitionsTheme: PageTransitionsTheme(
                builders: {
                  TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
                  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                },
              ),
              textSelectionTheme: TextSelectionThemeData(
                selectionColor: Color(0xFF007EE5),
                selectionHandleColor: Colors.blue,
              ),
            ),
        ),
      ),
    );
  }
}
