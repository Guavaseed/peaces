import 'package:flutter/material.dart';
import '../constants.dart';

class MyButton extends StatelessWidget{
  final String buttonText;
  final double width;
  final double height;
  final Color color;
  final VoidCallback mClicked;

  MyButton({Key key,this.buttonText, this.width,this.height, this.color, this.mClicked}) : super(key:key);

  @override
  Widget build(BuildContext con){
    return Container(
      height:height,
      width:width,
      child:GestureDetector(
        onTap:(){
          mClicked();
        },
        child:Card(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child:Center(
            child: Text('$buttonText',
                    style:TextStyle(fontSize:18,fontWeight:FontWeight.bold,color:baseColor,)),
          ),
          color:color,
        ),

      )
    );
  }
}