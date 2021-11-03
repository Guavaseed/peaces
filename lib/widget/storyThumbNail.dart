import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants.dart';
import '../Models/story.dart';


class StoryThumbNail extends StatelessWidget{

  final Story mStory;
  final double mSize;
  final double mTinySize;
  final bool isProfile;
  final double radius = 25;

  StoryThumbNail({this.mStory, this.mSize,this.mTinySize, this.isProfile});

	@override
  Widget build(BuildContext con){
    return GestureDetector(
      onTap:(){},
      child: Container(
        margin:EdgeInsets.all(5),
        width:mSize+20,
        height:mSize,
        child:Column(
           mainAxisAlignment:MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children:<Widget>[
               Positioned(
                 child:_thumb(con),
               ),
               Positioned(
                 bottom:3,
                 right:-5,
                 child: _icon(mTinySize),
               ),

              ]
            ),
          isProfile ==true?Text('${mStory.profileName}',
                      style:TextStyle(fontSize:14,fontWeight: FontWeight.bold)):SizedBox(width:1),
          ],
        ),
      ),
    );
  }

 
  Widget _thumb(BuildContext con){
    return Container(
      child:Center(
        child:_profilePic(con),
      ),
      margin:EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: storyColor,
          width: 3,
        ),
      ),
    );
  }

  Widget _icon(double mSize){
    return Container(
      height:mSize,
      width:mSize,
      margin:EdgeInsets.all(2),
      child:Center(
        child: Icon(Icons.camera_alt,size:mSize-7,color:baseColor),
      ),
      decoration:BoxDecoration(
        border:Border.all(color:Colors.white,width:2),
        borderRadius: BorderRadius.circular(mSize/2),
        color:appColor,
        
      ),
    );
  }

  Widget _profilePic(BuildContext con){
	  final ratio = MediaQuery.of(con).devicePixelRatio.toInt();
    int size = mSize.toInt();
    return Container(
      height:mSize,
      width:mSize,
      margin:EdgeInsets.all(2),
      child:Card(
        clipBehavior: Clip.antiAlias,
        child:CachedNetworkImage(
          imageUrl: mStory.profileUrl,
          fit: BoxFit.cover,
          height: mSize,
          width: mSize,
          errorWidget: (con,url,error)=>Icon(Icons.error),
        ),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius)
        ),
      ),
      
    );
  }
}