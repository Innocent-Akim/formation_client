import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formation_client/app/addParticipant/participant_bloc.dart';
import 'package:formation_client/app/cours/cours_bloc.dart';
import 'package:formation_client/controllers/MenuController.dart';
import 'package:formation_client/learning/loarning.dart';
import 'package:formation_client/response/responsive.dart';
import 'package:formation_client/router/activity_navigator.dart';
import 'package:formation_client/router/mypreferences.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'components/card_cours.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateBody();
  }
}

class _StateBody extends State<Home> {
  var bloc;
  ParticipantBloc stateManage;
  bool loading = false;
  @override
  void initState() {
    stateManage = BlocProvider.of<ParticipantBloc>(context);
    bloc = BlocProvider.of<CoursBloc>(context);

    bloc.add(CoursFind());
    super.initState();
  }

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
                                    fontSize:
                                        Responsive.isDesktop(context) ? 30 : 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Apprenez à apprendre, découvrez les compétences",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize:
                                        Responsive.isDesktop(context) ? 18 : 12,
                                    color: Colors.white,
                                    leadingDistribution:
                                        TextLeadingDistribution.proportional,
                                    wordSpacing: 0.0,
                                    textBaseline: TextBaseline.alphabetic,
                                  ),
                                )
                              ],
                            ),
                            Responsive.isDesktop(context)
                                ? SvgPicture.asset(
                                    "assets/images/reading.svg",
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                  )
                                : Text("")
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
            child: BlocBuilder<CoursBloc, CoursState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is CoursProgress) {
                  return Center(
                    child: SpinKitSpinningLines(
                      color: Colors.red,
                    ),
                  );
                }
                if (state is CoursFailed) {
                  return Text("${state.ERROR.toString()}");
                }
                if (state is CoursEmpty) {
                  return Center(
                    child: BuildMessage(
                      sizeImage: 300,
                      sizeText: 16,
                    ),
                  );
                }
                if (state is CoursLoading) {
                  return Center(
                    child: SpinKitSpinningLines(
                      color: Colors.red,
                    ),
                  );
                }

                if (state is CoursSucces) {
                  return Expanded(
                    child: GridView.builder(
                        itemCount: state.data.contents.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (orientation ==
                                    Orientation.portrait)
                                ? 1
                                : Responsive.isDesktop(context)
                                    ? 3
                                    : MediaQuery.of(context).size.width <= 850
                                        ? 1
                                        : 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Loarding(
                                    data: state.data.contents[index],
                                  );
                                }));
                                // Get.offAllNamed(learnig);
                              });
                            },
                            child: CardCours(
                              data: state.data.contents[index],
                              logo: state.data.contents[index].logo,
                              resume: state.data.contents[index].resume,
                              title: state.data.contents[index].title,
                              
                            ),
                          );
                        }),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
