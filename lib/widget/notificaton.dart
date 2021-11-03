import 'package:flutter/material.dart';
import '../constants.dart';

class NotifyIcon extends StatefulWidget{
  final bool newMessage;
  final double size;
  final VoidCallback myTapped;

  NotifyIcon({this.newMessage,this.size,this.myTapped});

  _NotificationState createState()=> _NotificationState();
}

class _NotificationState extends State<NotifyIcon>{
  @override
  Widget build(BuildContext con){
    return GestureDetector(
      onTap:(){
        widget.myTapped();
      },
      child:Container(
        //height: widget.size,
        //width:widget.size,
        child:Stack(
          children: <Widget>[
            Positioned(
              child:Icon(Icons.notifications_none,size:widget.size,color: Colors.black45,)
            ),
            _newIcon(),
          ],
        ),
      )
    );
  }

  Widget _newIcon(){
    if(widget.newMessage){
      return  Positioned(
              top:5,
              left:3,
              child:CircleAvatar(
                radius:5,
                backgroundColor: notifyColor,
                
              )
      );
    }
    else{
      return Container();
    }
  }
}