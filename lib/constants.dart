import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const bgWhite = Color(0xFFFFFFFF);
const bgGrey = Color(0xFF8D8E98);

const defaultPadding = 16.0;

class AppConst {
  static AppConst _instance;
  static AppConst get getInstance {
    return _instance ??= new AppConst();
  }

  String primaryFont = 'Poppins';
}
