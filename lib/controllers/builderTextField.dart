import 'package:flutter/material.dart';

Widget buildTextField(
    {var controller,
    var hintText,
    labelText,
    Widget prefixIcon,
    bool isvisible = false,
    Widget suffixIcon,Function onChanged, VoidCallback onTap }) {
  return Container(
    height: 50,
    child: TextFormField(
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
