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
  Responsive respo;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
              color: primaryColor,
              child: Center(
                child: Container(
                  // scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: Colors.white,
                                    leadingDistribution:
                                        TextLeadingDistribution.proportional,
                                    wordSpacing: 0.0,
                                    textBaseline: TextBaseline.alphabetic,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (orientation == Orientation.portrait)
                        ? 1
                        : Responsive.isDesktop(context)
                            ? 3
                            : MediaQuery.of(context).size.width <= 850
                                ? 1
                                : 2),
                itemBuilder: (context, index) {
                  return CardCours();
                }),
          )
        ],
      ),
    );
  }
}
