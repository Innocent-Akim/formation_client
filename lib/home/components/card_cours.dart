import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:formation_client/app/addParticipant/participant_bloc.dart';
import 'package:formation_client/constants.dart';
import 'package:formation_client/controllers/MenuController.dart';
import 'package:formation_client/router/mypreferences.dart';
import 'package:line_icons/line_icons.dart';

class CardCours extends StatefulWidget {
  final title;
  final resume;
  final logo;
  final data;
  final widget;

  const CardCours({Key key, this.title, this.resume, this.logo, this.data, this.widget})
      : super(key: key);

  @override
  _CardCoursState createState() => _CardCoursState();
}

class _CardCoursState extends State<CardCours> {
  ParticipantBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<ParticipantBloc>(context);
    super.initState();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 2.5, right: 2.5, top: 5),
      child: Card(
        elevation: 1.0,
        child: Stack(
          children: [
            widget.widget,
            Container(
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
                              color: Colors.green),
                        ),
                      ],
                    ),
                    Text(
                      "${widget.title}",
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
                            Icon(Icons.network_cell_rounded,
                                color: primaryColor),
                            SizedBox(width: 3),
                            Text("Facile",
                                style: TextStyle(color: Colors.grey)),
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
                      "${widget.resume}",
                      style: TextStyle(
                        fontSize: 16,
                        leadingDistribution:
                            TextLeadingDistribution.proportional,
                        wordSpacing: 0.0,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                    Expanded(
                      child: widget.logo == null
                          ? Image.asset(
                              "assets/images/react.png",
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              "${widget.logo}",
                              fit: BoxFit.cover,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
