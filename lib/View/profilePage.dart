import 'package:flutter/material.dart';
import '../widget/myWidgets.dart';

import "../constants.dart";

import '../Models/story.dart';
import '../Models/post.dart';
import '../Models/profile.dart';
import '../Store/data.dart';


class ProfilePage extends StatelessWidget{

  Story eStory; 
  Post ePost;
  Profile eProfile;

  double _h,_w;
  double edgeLR;
  double cardRadius = 5;

  
  ProfilePage (){
    eStory = Story(profileName: 'Victor',profileUrl: storyProfilePix);
    eProfile = _me();
    edgeLR = 40;
    
  }

  @override
  Widget build(BuildContext con){
    _h = MediaQuery.of(con).size.height;
    _w = MediaQuery.of(con).size.width;

    return Scaffold(
      backgroundColor: baseColor,
      body:_page(),
    );
  }

  Profile _me(){   
    return Profile(
      pUserName:'Victor A.',pHandle:'@vickAsuqo',pJobName:'Software Developer',
      pAboutMe:'Victor is a software \ndeveloper with 12 years of experience',
      pPostCount:'20k',pFollowingCount:'2',pFollowersCount:'300k',
    );
  }

  Widget _page(){
    return Container(
      width:_w,
      height:_h,
      child:Column(
        children: <Widget>[
          SizedBox(height:20),
          Expanded(
            flex:1,
            child:_heading(),
          ),

          Expanded(
            flex:4,
            child:_profile(),
          ),
        
          SizedBox(height:20),
          Expanded(
            flex:4,
            child:_profilePost(),
          ),
        ],
      ),
    );
  }

  Widget _heading(){
    return Container(
      margin: EdgeInsets.fromLTRB(60,0, 60,0),
      child:Row(
        children: <Widget>[
          Expanded(
            flex:4,
            child:Text("Profile", style:TextStyle(fontWeight:FontWeight.bold, fontSize: 20))
          ),

          Expanded(
            flex:1,
            child:GestureDetector(
              onTap:(){},
              child:Icon(Icons.menu)
            ),
          ),
        ],
      ),
    );
  }

  Widget _profile(){
    return Container(
      height:_h-50,
      width: _w-50,
      child:Stack(
        children: <Widget>[
          Positioned(
            child:_profileDetails(),
          ),

          Positioned(
            bottom:1,
            child:_profileStat(),
          ),
        ],
      ),
    );
  }
  Widget _profileDetails(){
    double mH= _h/11;
    return Container(
      margin: EdgeInsets.fromLTRB(15,0, 15,20),
      child:Card(
        elevation:10,
        child:Container(
          margin: EdgeInsets.fromLTRB(15,30, 15,0),
          child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment:CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height:_h/5.8,
                    child:StoryThumbNail(isProfile:false,mSize:mH,mTinySize:22, mStory: eStory),
                  ),
                  SizedBox(width:20),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height:15),
                      SizedBox(
                        width:100,height:20,
                        child:FittedBox(
                          fit:BoxFit.contain,
                          child:Text("${eProfile.pHandle}",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height:5),
                      SizedBox(
                        width:100,height:20,
                        child:FittedBox(
                          fit:BoxFit.contain,
                          child:Text("${eProfile.pUserName}",style:TextStyle(fontSize:22,
                            fontWeight:FontWeight.bold,color:appColor)),
                        ),
                      ),
                      SizedBox(height:5),
                      SizedBox(
                        width:100,height:20,
                        child:FittedBox(
                          fit:BoxFit.contain,
                          child:Text("${eProfile.pJobName}",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            Container(
               margin: EdgeInsets.fromLTRB(15,0, 15,0),
              width:_w,
              height:_h/9,
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:<Widget>[
                  Expanded(
                    flex:1,
                    child:Text("About Me",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold))
                  ),

                  Expanded(
                    flex:2,
                    child:Text("${eProfile.pAboutMe}",overflow: TextOverflow.ellipsis),
                  ),
                ]
              ),
            ),
          ],
        )
        ),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
      ),
    );
  }
  Widget _profileStat(){
    return Container(
      height:70,
      width: _w-150,
       margin: EdgeInsets.fromLTRB(_w/8,0,_w/15,0),
       
       //
       child:Card(
         color:appColor,
         elevation:10,
         shape:RoundedRectangleBorder(
           borderRadius:BorderRadius.circular(10)
         ),
         child:Row(
         children: <Widget>[
           Expanded(
             flex:1,
             child:Container(
                //color:appColorLight,
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Text("${eProfile.pPostCount}",
                        style:TextStyle(fontWeight:FontWeight.bold,color:baseColor,fontSize:14)),
                    Text("POST",style:TextStyle(fontWeight:FontWeight.bold,color:baseColor,fontSize:14))
                  ],
                ),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:appColorLight,
                  ),
              ),
           ),

           Expanded(
             flex:1,
             child:Container(
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${eProfile.pFollowingCount}",
                    style:TextStyle(fontWeight:FontWeight.bold,color:baseColor,fontSize:14)),
                    Text("Following",style:TextStyle(fontWeight:FontWeight.bold,color:baseColor,fontSize:14))
                  ],
                ),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
              ),
           ),

            Expanded(
             flex:1,
             child:Container(
              
                child:Column(
                   mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${eProfile.pFollowersCount}",
                    style:TextStyle(fontWeight:FontWeight.bold,color:baseColor,fontSize:14)),
                    Text("Followers",style:TextStyle(fontWeight:FontWeight.bold,color:baseColor,fontSize:14))
                  ],
                ),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
              ),
           ),
         ],
       ),
       ),
    );
  }

   Widget _profilePost(){
    double aH = _h/4;
    return Container(
      width:_w,
      height:_h/2,
      child:Card(
        elevation:10,
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child:Container(
          padding:EdgeInsets.fromLTRB(20, 20, 20, 0),
          child:Column(
            children: <Widget>[
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width:20),
                  Expanded(
                    flex:3,
                    child:Text("My Posts",style:TextStyle(fontWeight: FontWeight.bold))
                  ),
                  Expanded(
                    flex:1,
                    child: GestureDetector(
                      onTap:(){},
                      child:Icon(Icons.apps,size:27),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: GestureDetector(
                      onTap:(){},
                      child:Icon(Icons.line_style,size:27),
                    ),
                  ),
                ],
              ),
             Container(
               height:_h/3-10,
              // padding:EdgeInsets.fromLTRB(0, 0, 0, 2),
               child: ListView.builder(
                  itemCount: Data.dataPost.length,
                  itemBuilder:(con,index){
                    return Container(
                        child: PostThumbNail(mSizeW: _w/2, mSizeH: aH,mPost: Data.dataPost[index]),
                        //margin:EdgeInsets.fromLTRB(0, 0, 20, 1),
                      );
                  }
                ),
             ),
                
            ],
          ),
        ),
      ),
    );
  }
}