import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants.dart';
import '../Models/post.dart';

class PostThumbNail extends StatefulWidget{
  final  Post mPost;
  final double mSizeH,mSizeW;
  
  PostThumbNail({this.mPost, this.mSizeH, this.mSizeW});

  @override
  _PostThumbNailState createState()=> _PostThumbNailState();
}

class _PostThumbNailState extends State<PostThumbNail>{

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext con){
    return GestureDetector(
      onTap:(){
        Navigator.pushNamed(con,'/postDetail');
      },
      child: Container(
        height:widget.mSizeH-50,
        width:widget.mSizeW,
        child:Card(
          child:_content(),
          elevation:5,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            
          ),
        ),
      )
    );
  }

  Widget _content(){
    return Row(
      children:<Widget>[
        Expanded(
          flex:3,
          child:_image(),
        ),

        /*Expanded(
          flex:1,
          child:SizedBox(width:1),
        ),*/
        SizedBox(width:20),

        Expanded(
          flex:6,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              SizedBox(height:20),
              _title(),
              SizedBox(height:10),
              _subTitle(),
            ]
          ),
        ),
      ]
    );
  }

  Widget _image(){
    return Container(
      height:widget.mSizeH,
      width:70,
      child:Card(
        clipBehavior: Clip.antiAlias,
        child:CachedNetworkImage(
          
          imageUrl: widget.mPost.pImage,
          fit: BoxFit.cover,
          height: widget.mSizeH,
          width: widget.mSizeW,
          errorWidget: (con,url,error)=>Center(
            child:Icon(Icons.error),
          ),
        ),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(10)
        ),
      ),
    );
  }
  Widget _title(){
    return  Text("${widget.mPost.pTitle}", overflow: TextOverflow.ellipsis,
        style:TextStyle(fontWeight:FontWeight.bold, color:appColor,fontSize:16));
  }

  Widget _subTitle(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
        Wrap(
          children: <Widget>[
            Text("Why Big Data needs \nThick data",overflow:TextOverflow.ellipsis,
            textAlign:TextAlign.left, style:TextStyle(fontWeight:FontWeight.bold,fontSize:14)),
          ],
        ),
       // SizedBox(height:10),
        _stat(),
      ]
    );
  }
  Widget _stat(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:<Widget>[
        Expanded(
          flex:1,
          child:IconButton(
            onPressed:(){},
            icon: Icon(Icons.thumb_up),
          ),
        ),
        SizedBox(width:10),
        Expanded(
          flex:1,
          child:Text('21k'),
        ),
        Expanded(
          flex: 1,
          child:Icon(Icons.timer),
        ),
        Expanded(
          flex:1,
          child:Text('1hr'),
        ),
        Expanded(
          flex:1,
          child:Icon(Icons.bookmark),
        ),
        Expanded(
          flex:1,
          child:SizedBox(width:2)
        ),
        
      ]
    );
  }

  

}