import 'package:flutter/material.dart';
import "../constants.dart";

class Logo extends StatelessWidget {
  final bool use;
  final double mSize;
  const Logo({this.use, this.mSize});

  @override
  Widget build(BuildContext con) {

    return Container(
      height:mSize,
      width:mSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: <Widget>[
          use==true?logo(): Container(),
          bigText(bigText: "pecece"),
          smallText(text: ".com")
      ]),
    );
  }


  Widget logo() {
    return Container(child: Image.asset("assets/images/pLogo.jpeg",height:50,width:50));
  }

  Widget bigText({String bigText}) {
    return Container(
      height: 40,
      width: 200,
      child: Card(color: appColor, 
      child: Text(bigText, textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 30, fontFamily: 'Verdana',fontWeight:FontWeight.bold,color: baseColor))),
    );
  }

  Widget smallText({String text}) {
    return Container(child: Text(text, textAlign: TextAlign.center, 
    style: TextStyle(fontSize: 25, color: appColor)));
  }
}
