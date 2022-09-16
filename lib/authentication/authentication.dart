import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formation_client/controllers/MenuController.dart';
import 'package:formation_client/controllers/builderTextField.dart';
import 'package:formation_client/controllers/style.dart';
import 'package:formation_client/response/responsive.dart';
import 'package:line_icons/line_icons.dart';

import '../constants.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool isLoading = false;
  bool isvisible = true;
  bool isvisibleChanged = false;
  final _formKey = GlobalKey<FormState>();
  var username = TextEditingController();

  var passwordChange = TextEditingController();
  var genre;

  var password = TextEditingController();
  var dateNaissaissance = TextEditingController();
  var nom = TextEditingController();
  var postnom = TextEditingController();
  var prenom = TextEditingController();
  var email = TextEditingController();
  var telephone = TextEditingController();

  var bloc;
  @override
  void initState() {
    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateNaissaissance.text = picked.toString().substring(0,10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: !isvisibleChanged ? buildLogin() : buildSignUp(),
          ),
        ),
      ),
    );
  }

  buildLogin() {
    return Row(
      children: [
        Responsive.isDesktop(context)
            ? Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.width * .3,
                  color: Colors.white,
                  child: SvgPicture.asset(
                    "assets/images/leadingPage.svg",
                  ),
                ),
              )
            : Text(""),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(24),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Responsive.isDesktop(context)
                        ? MediaQuery.of(context).size.width * .25
                        : MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Image.asset("assets/images/logo.png"),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text("Login",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "Formation en ligne",
                              color: lightGrey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (val) => val != null && val.isEmpty
                              ? "le champ est required"
                              : null,
                          controller: username,
                          decoration: InputDecoration(
                            labelText: "Nom d'utilisateur",
                            hintText: "gentilakili98@gmail.com",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onFieldSubmitted: (_) {},
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          obscureText: isvisible,
                          controller: password,
                          decoration: InputDecoration(
                            labelText: "Mot depasse",
                            hintText: "12345",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  isvisible
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  size: 15,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isvisible = !isvisible;
                                  });
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (value) {}),
                                CustomText(
                                  text: "Remeber Me",
                                ),
                              ],
                            ),
                            CustomText(
                                text: "Mot de passe oublié ?", color: active)
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            // Get.offAllNamed(dashboardPageRoute);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF007EE5),
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(
                              child: isLoading
                                  ? SpinKitSpinningLines(
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  : CustomText(
                                      text: "Login",
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isvisibleChanged = !isvisibleChanged;
                            });
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Do not have admin credentials? "),
                                TextSpan(
                                  text: !isvisibleChanged
                                      ? "S'inscrire"
                                      : "Authentifications",
                                  style: TextStyle(color: active),
                                  onEnter: (event) {},
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildSignUp() {
    return Row(
      children: [
        Responsive.isDesktop(context)
            ? Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.width * .3,
                  color: Colors.white,
                  child: SvgPicture.asset(
                    "assets/images/learning.svg",
                  ),
                ),
              )
            : Text(""),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(24),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Responsive.isDesktop(context)
                        ? MediaQuery.of(context).size.width * .25
                        : MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Image.asset("assets/images/logo.png"),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text("S'INSCRIRE",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "Formation en ligne",
                              color: lightGrey,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        buildTextField(
                          controller: nom,
                          hintText: "Entrez votre nom",
                          labelText: "Nom",
                          prefixIcon: Icon(LineIcons.user),
                        ),
                        SizedBox(height: 15),
                        buildTextField(
                          controller: postnom,
                          hintText: "Entrez votre Postnom",
                          labelText: "Postnom ",
                          prefixIcon: Icon(LineIcons.user),
                        ),
                        SizedBox(height: 15),
                        buildTextField(
                          controller: prenom,
                          hintText: "Entrez votre Prénom",
                          labelText: "Prénom ",
                          prefixIcon: Icon(LineIcons.user),
                        ),
                        SizedBox(height: 15),
                        cbList(
                            valeur: genre,
                            title: "genre",
                            onChanged: (val) {
                              setState(() {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                genre = val;
                              });
                            },
                            list: isList(value: ["Homme", "Femme"]),
                            icon: Icon(
                                genre == 'Homme'
                                    ? LineIcons.male
                                    : LineIcons.female,
                                color: primaryColor)),
                        SizedBox(height: 15),
                        buildTextField(
                            controller: dateNaissaissance,
                            hintText: "Entrez la date naissance",
                            labelText: "Date de naissance",
                            textInputType: TextInputType.phone,
                            prefixIcon: Icon(LineIcons.calendar),
                            onTap: () {
                              _selectDate(context);
                            }),
                        SizedBox(height: 15),
                        buildTextField(
                          controller: telephone,
                          hintText: "Entrez le numéro de téléphone",
                          labelText: "Telephone ",
                          prefixIcon: Icon(LineIcons.phone),
                        ),
                        SizedBox(height: 15),
                        buildTextField(
                          controller: email,
                          hintText: "Entrez votre adresse mail",
                          labelText: "Mail ",
                          textInputType: TextInputType.emailAddress,
                          prefixIcon: Icon(LineIcons.mailchimp),
                        ),
                        SizedBox(height: 15),
                        buildTextField(
                          isvisible: true,
                          controller: passwordChange,
                          hintText: "Entrez votre mot de passe",
                          labelText: "Mot de passe ",
                          prefixIcon: Icon(LineIcons.lock),
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            setState(() {});
                            // Get.offAllNamed(dashboardPageRoute);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFF007EE5),
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(
                              child: isLoading
                                  ? SpinKitSpinningLines(
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  : CustomText(
                                      text: "Enregistrer",
                                      color: Colors.white,
                                      size: 13,
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isvisibleChanged = !isvisibleChanged;
                            });
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Do not have admin credentials? "),
                                TextSpan(
                                  text: !isvisibleChanged
                                      ? "S'inscrire"
                                      : "Authentifications",
                                  style: TextStyle(color: active),
                                  onEnter: (event) {},
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
