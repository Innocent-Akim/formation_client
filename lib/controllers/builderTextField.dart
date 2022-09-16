import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

Widget buildTextField(
    {var controller,
    var hintText,
    labelText,
    Widget prefixIcon,
    bool isvisible = false,
    Widget suffixIcon,
    Function onChanged,
    VoidCallback onTap,
    TextInputType textInputType = TextInputType.text,
    bool isDesebled = false}) {
  return Container(
    height: 50,
    child: TextFormField(
      keyboardType: textInputType,
      readOnly: isDesebled,
      obscureText: isvisible,
      validator: (val) =>
          val != null && val.isEmpty ? "le champ est required" : null,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: (_) {},
    ),
  );
}

Widget cbList(
        {List<DropdownMenuItem<String>> list,
        title,
        String valeur,
        Function onChanged,
        Icon icon,
        child}) =>
    DropdownButtonFormField(
      isExpanded: true,
      items: list,
      value: valeur,
      onChanged: onChanged,
      hint: Text(
        "Sélectionnez $title",
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        prefixIcon: icon,
        //labelText: "Technologies",
        border: OutlineInputBorder(
          // borderSide: BorderSide. ,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        hintStyle: TextStyle(
            fontSize: 13, color: Colors.black, fontWeight: FontWeight.normal),
        contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      ),
      validator: (val) => val == null ? "Ce champs est obligatoire" : null,
      onSaved: (val) => valeur = val,
    );

List<DropdownMenuItem<String>> isList({List<String> value}) {
  return value
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: value == null || value.isEmpty
              ? Text("")
              : Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      child: Center(
                        child: Text(
                          value.substring(0, 1).toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(width: 3),
                    Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
        ),
      )
      .toList();
}

Widget showTop({BuildContext context, Icon icon, title, Color color}) =>
    Flushbar(
      icon: icon,
      shouldIconPulse: false,
      duration: Duration(seconds: 3),
      // message: title,
      messageText: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      borderColor: primaryColor,
      // borderRadius: 20,
      // borderWidth: 20,
      flushbarStyle: FlushbarStyle.GROUNDED,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      backgroundColor: color,
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: Duration(seconds: 1),
    )..show(context);
