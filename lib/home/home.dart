import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formation_client/response/responsive.dart';

import '../constants.dart';
import 'components/card_cours.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateBody();
  }
}

class _StateBody extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            color: primaryColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Votre avenir commence ici",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Apprenez à apprendre, découvrez les compétences de demain, et prenez votre carrière en main.",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        "assets/images/reading.svg",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * .2,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (orientation == Orientation.portrait)
                        ? 2
                        : Responsive.isDesktop(context)
                            ? 3
                            : Responsive.isTablet(context)
                                ? 2
                                : 1),
                itemBuilder: (context, index) {
                  return CardCours();
                }),
          )
        ],
      ),
    );
  }
}
