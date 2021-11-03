import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants.dart';
import '../Models/article.dart';


class ArticleThumbNail extends StatelessWidget{
  final double mSize;
  final Article mArticle;

  ArticleThumbNail({Key key,this.mSize, this.mArticle}) :super(key:key);

  @override 
  Widget build(BuildContext con){
    return GestureDetector(
      onTap:(){
        Navigator.pushNamed(con,'/articleDetail');
      },
      child:Container(
          height:mSize,
          width: mSize-(mSize/3),
          child: Stack(
            children: <Widget>[
              Positioned(
                child:_card(con)
              ),
              Positioned(
                bottom: 30,
                left:30,
                child:_text()
              ),
            ],
          )
        )
    );
  }

  Widget _card(BuildContext con){
    final ratio = MediaQuery.of(con).devicePixelRatio.toInt();
    int size = mSize~/7.toInt();
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation:2,
      child:Container(
        color:Colors.blueGrey[800],
        child:CachedNetworkImage(
          imageUrl:mArticle.aIMage,
          fit: BoxFit.cover,
          height: mSize,
          width: mSize,
          errorWidget: (con,url,error)=>Center(
            child:Icon(Icons.error),
          ),
        ),
      ),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }

  Widget _text(){
    return SizedBox(
      height:50,width:90,
      child:FittedBox(
        fit:BoxFit.contain,
        child:Text('${mArticle.aTag}', overflow:TextOverflow.ellipsis,
        style:TextStyle(fontSize:22,fontWeight: FontWeight.bold, color: baseColor))
      ),
    );
  }
}