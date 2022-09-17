import 'package:flutter/material.dart';
import 'package:formation_client/constants.dart';
import 'package:line_icons/line_icons.dart';

class CardCours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 2.5, right: 2.5, top: 5),
      child: Card(
        elevation: 1.0,
        child: Container(
          width: size.width * .34,
          height: size.height * .5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Développement - Cours",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.green
                      ),
                    ),
                  ],
                ),
                Text(
                  "Apprenez à créer votre site web avec HTML5 et CSS3",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    // Facile20 heures
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.network_cell_rounded, color: primaryColor),
                        SizedBox(width: 3),
                        Text("Facile", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Icon(
                          LineIcons.clock,
                          color: Colors.green,
                        ),
                        SizedBox(width: 3),
                        Text(
                          "20 heures",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "Vous rêvez d'apprendre à créer des sites web ? Débutez avec ce cours qui vous enseignera tout ce qu'il faut savoir sur le développement de sites web en HTML5 et CSS3 !",
                  style: TextStyle(
                    fontSize: 16,
                    leadingDistribution: TextLeadingDistribution.proportional,
                    wordSpacing: 0.0,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "assets/images/react.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
