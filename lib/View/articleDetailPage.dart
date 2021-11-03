import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import "../constants.dart";
import '../Models/post.dart';
import '../Models/article.dart';

class ArticleDetailPage  extends StatefulWidget{
  final Post ePost;
  final Article mArticle;

  ArticleDetailPage({Key key, this.ePost, this.mArticle}) : super(key : key);

  @override
  _ArticleDetailPageState createState()=> _ArticleDetailPageState();
}
class _ArticleDetailPageState extends State<ArticleDetailPage>{

  double _h,_w;

  @override
  Widget build(BuildContext con){
    _h = MediaQuery.of(con).size.height;
    _w = MediaQuery.of(con).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
            onPressed:(){},
            backgroundColor: appColorLight,
            icon: Icon(Icons.thumb_up,color: baseColor),
            label: Text('${widget.ePost.pLikes}   .')
            ),
      backgroundColor:baseColor,
      body:Container(
        height:_h,
        width: _w,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:30),
            Expanded(
              flex:1,
              child: const _heading(),
            ),

            Expanded(
              flex:1,
              child: _title(),
            ),
            Expanded(
              flex:1,
              child: _profile(),
            ),

            Expanded(
              flex:3,
              child: _bgImage(con),
            ),

             Expanded(
              flex:4,
              child: _writeUp(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(){
    return Container(
     padding:EdgeInsets.fromLTRB(40, 1, 0, 1),
     child:Text('${widget.ePost.pTitle}',textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,
            style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30))
    );
  }

  Widget _profile(){
    return Container(
      padding:EdgeInsets.fromLTRB(40, 1, 30, 1),
      child:Row(
        children: <Widget>[
          Container(
            //color:appColorLight,
            height:50,width: 50,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(20),
              color:appColorLight,
            ),
          ),
          SizedBox(width:30),
          Expanded(
            flex:3,
            child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Text("Micheal tyris",style:TextStyle(fontWeight:FontWeight.bold)),
                  Text("posted 1min ago",style:TextStyle(fontWeight:FontWeight.bold))
                ],
              ),
          ),
          Expanded(
            flex:1,
            child:Icon(Icons.send),
          ),
          Expanded(
            flex:1,
            child:Icon(Icons.bookmark),
          ),
        ],
      ),
    );
  }

  Widget _bgImage(BuildContext con){
     final ratio = MediaQuery.of(con).devicePixelRatio.toInt();
      int size = _w~/2.toInt();

    return Container(
      height: _h-100,
      width: _w,
      child:Card(
        child:CachedNetworkImage(
          imageUrl: articleImage,
          fit: BoxFit.cover,
          height: _w,
          width: _h,
          errorWidget: (con,url,error)=>Icon(Icons.error),
        ),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }

  Widget _writeUp(){
    return Container(
      height:_h/3,
      width:_w,
      padding:EdgeInsets.fromLTRB(40, 1, 20,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child:ListView(
              children:<Widget>[
                Text('${widget.ePost.pDes}',style:TextStyle(fontSize:22)),
              ]
            ),
          ),
        ],
      ),
    );
  }
}

class _heading extends StatelessWidget{
  const _heading();
  @override
  Widget build(BuildContext con){
     return Container(
      padding:EdgeInsets.fromLTRB(30, 1, 30, 1),
      child:Row(
        mainAxisAlignment:MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex:1,
            child:GestureDetector(
              onTap:(){
                Navigator.pop(con);
              },
              child:Icon(Icons.keyboard_arrow_left,size:40,color: Colors.black),
            ),
          ),
          Expanded(
            flex:5,
            child:Container(width:10),
          ),
          Expanded(
            flex:1,
            child:GestureDetector(
              onTap:(){},
              child:Icon(Icons.more_horiz),
            ),
          ),
        ],
      ),
    );
  }
}

 