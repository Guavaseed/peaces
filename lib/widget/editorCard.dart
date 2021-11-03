import 'package:flutter/material.dart';
import '../constants.dart';

class EditorCard extends StatefulWidget{

  final double mWidth;
  final double mHeight;
  final double mRadius;
  final Color mBgColor;

  final VoidCallback onAddImage;
  final VoidCallback onAddClip;
  final VoidCallback onFormatText;
  final VoidCallback onAttachFile;
  final VoidCallback onSend;
  

  EditorCard({ Key key, 
              this.mWidth, 
              this.mHeight, 
              this.mBgColor, 
              this.mRadius,
              this.onAddImage,
              this.onAddClip,
              this.onFormatText,
              this.onAttachFile,
              this.onSend,
              }) : super(key :key);

  @override
  _EditorCardState createState()=> _EditorCardState();
}

class _EditorCardState extends State<EditorCard>{
  @override
  Widget build(BuildContext con){
    return Container(
      height:widget.mHeight,
      width:MediaQuery.of(con).size.width,
      child:Card(
          color:widget.mBgColor,
          elevation:5,
          shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(widget.mRadius),
          ),
          child:Row(
            children: <Widget>[
              Expanded(
                child:CircleAvatar(
                  backgroundColor: baseColor,
                  radius: widget.mRadius-5,
                  child:Icon(Icons.close),
                ),
              ),
              
              Expanded(
                child:GestureDetector(
                  onTap: (){
                    widget.onAddImage();
                  },
                  child:Icon(Icons.image,color:baseColor)
                ),
              ),

              Expanded(
                child:GestureDetector(
                  onTap:(){
                    widget.onAddClip();
                  },
                  child:Icon(Icons.play_circle_filled,color:baseColor)
                ),
              ),

              Expanded(
                child:GestureDetector(
                  onTap:(){
                    widget.onFormatText();
                  },
                  child:Icon(Icons.format_align_center,color:baseColor)
                ),
              ),

              Expanded(
                child:GestureDetector(
                  onTap:(){
                    widget.onAttachFile();
                  },
                  child:Icon(Icons.add,color:baseColor),
                ),
              ),

              Expanded(
                child:GestureDetector(
                  onTap:(){
                    widget.onSend();
                  },
                  child:Icon(Icons.send,color:baseColor),
                ),
              )
            ],
          ),
        )
    );
  }

}