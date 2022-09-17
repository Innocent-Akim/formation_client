import 'package:flutter/material.dart';

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
      Expanded(
        child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (orientation == Orientation.portrait) ? 2 : 3),
            itemBuilder: (context, index) {
              return CardCours();
            }),
      )
        ],
      ),
    );
  }
}
