import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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


class BuildMessage extends StatelessWidget {
  final sizeText;
  final sizeImage;

  const BuildMessage({Key key, this.sizeText, this.sizeImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SvgPicture.asset(
                "assets/icons/isEmpty.svg",
                height: sizeImage,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Aucun résultat trouvé",
                style:TextStyle(
                  color: Colors.white,
                  fontSize: sizeText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
