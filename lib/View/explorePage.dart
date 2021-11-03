import 'package:flutter/material.dart';

import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widget/myWidgets.dart';
import '../constants.dart';
import '../Models/article.dart';
import '../Models/post.dart';
import '../Store/data.dart';

import '../Provider/articleProvider.dart';
import '../Provider/bottomNavBarIndexProvider.dart';
import '../Provider/storyProvider.dart';

class ExplorePage extends StatelessWidget{

  BuildContext con;
  double _h,_w;

  Post ePost;
  int selectedIndex = 2;
  bool isNewArticle = false;

  final _pageController = PageController(initialPage: 0);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext con){
    con = con;
    _h = MediaQuery.of(con).size.height;
    _w = MediaQuery.of(con).size.width;

    return Scaffold(
      key:_scaffoldKey,
      body:_pageView(con),
      bottomNavigationBar: _bottomNav(con),
      backgroundColor: baseColor,
    );
  }

  Widget _bottomNav(BuildContext con){
    return Consumer<BottomNavBarIndexProvider>(
      builder:(con,bottomIndex,child){
        return FFNavigationBar(
          theme:FFNavigationBarTheme(
            barBackgroundColor:baseColor,
            selectedItemBorderColor:appColor,
            selectedItemBackgroundColor: appColor,
            selectedItemLabelColor: appColor,
          ),
          items:[
            FFNavigationBarItem(
              iconData: Icons.home,
              label:'Home'
            ),
            FFNavigationBarItem(
              iconData: Icons.import_contacts,
              label:'Article'
            ),
            FFNavigationBarItem(
              iconData: (isNewArticle)?Icons.cancel: Icons.add,
              label:''
            ),
            FFNavigationBarItem(
              iconData: Icons.search,
              label:'Search'
            ),
            FFNavigationBarItem(
              iconData: Icons.menu,
              label:'Menu'
            ),
          ],
          selectedIndex:bottomIndex.selectedIndex,
          onSelectTab: (index){
            Provider.of<BottomNavBarIndexProvider>(con,listen:false).moveIndex(index);

            if(index==2){
              isNewArticle =!isNewArticle;
              if(isNewArticle==false){
                _pageController.animateToPage(0, 
                          duration:Duration(milliseconds: 400), 
                          curve: Curves.easeInOut);
              }
            else if(_pageController.hasClients){
              _pageController.animateToPage(1, 
                          duration:Duration(milliseconds: 1000), 
                          curve: Curves.easeInOut);
            }
            }
            if(index == 4){
              if(index==4){
                Navigator.pushNamed(con,'/profile');
              }
            }       
          }
        );
      }
    );
  }

  Widget _pageView(BuildContext con){
    return Container(
      height:_h,
      width:_w,
      child:PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index){
         Provider.of<BottomNavBarIndexProvider>(con,listen:false).setIndex(index);
        },
        children: <Widget>[
          _page(con),
          CreateArticleDialog(
            onSubmitted: (){           
              if(_pageController.hasClients){
                _pageController.animateToPage(0, 
                            duration:Duration(milliseconds: 200), 
                            curve: Curves.easeInOut);
              _scaffoldKey.currentState.showSnackBar(_snackBar());
              }
            },
          ),
        ],
      ),
    );
  }
  Widget _snackBar(){
    return SnackBar(
      backgroundColor:appColor,
      duration:Duration(seconds:3),
      content: Text('New Article posted', style:TextStyle(fontWeight:FontWeight.bold)),
    );
  }

  Widget _page(BuildContext con){
    return Container(
      height:_h,
      width:_w,
      //margin: EdgeInsets.fromLTRB(45, 60, 1, 1),
      child:Column(
        children: <Widget>[
          SizedBox(height:30),
          Expanded(
            flex:2,
            child:Container(
              padding: EdgeInsets.fromLTRB(45, 40, 1, 0),
              child:_heading(con),
            ),
          ),
          Expanded(
            flex:1,
            child:Container(
              padding: EdgeInsets.fromLTRB(45, 1, 1, 0),
              child:_title(),
            ),
          ),
         Expanded(
           flex:3,
           child:  _storyView(con),
         ),
         SizedBox(height:4),
          Expanded(
            flex:7,
            child:_articleView(con),
          ),
         Expanded(
           flex:1,
           child:Container(
             padding: EdgeInsets.fromLTRB(45, 1, 1, 1),
             child:_postViewTitle(),
           ),
         ),
         
         Expanded(
           flex:5,
           child:Container(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
             child:_postView(),
           ),
         ),
        ],
      ),
    );
  }
  Widget _heading(BuildContext con){
    return Row(
      children: <Widget>[
        Expanded(
          flex:5,//
          child:GestureDetector(
            child:Text("Hi, Victor",style:TextStyle(fontSize: 18)),
            onTap:(){
              //Navigator.pushNamed(con,'/profile');
            }
          ),
        ),
        Expanded(
          flex:1,
          child:NotifyIcon(
            myTapped: (){},
            newMessage: true,
            size: 30,
          )
        ),
      ],
    );
  }

  Widget _title(){
    return Container(
      height:30,
      child:Row(
          children:<Widget>[
            Text("Explore today's", style:TextStyle(fontWeight:FontWeight.bold,fontSize:20))
          ]
        )
    );
  }

   Widget _storyView(BuildContext con){
    double mH= _h/15;
    return Container(
      width:_w,
      height:_h/5,
      child:Consumer<StoryProvider>(
        builder:(con,story,child){
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: story.storySize,
            itemBuilder: (builder, index){
              return StoryThumbNail(isProfile: true,mSize:mH, mTinySize: 23, mStory:story.stories[index]);
            },
          );
        }
      ),
    );
  }
  Widget _articleView(BuildContext con){
    double aH = _h/3;
    return Container(
      width:_w,
      height:aH,
      child:Consumer<ArticleProvider>(
        builder:(con,article,child){
           return CarouselSlider.builder(
             itemCount: article.articleSize,
             itemBuilder: (con,index,page){
               return  ArticleThumbNail(mSize:_h/2,mArticle:article.allArticles[index]);
             },
             options:CarouselOptions(
               height:aH,
               enlargeCenterPage: true,
               reverse:false,
               viewportFraction: 0.5,
               scrollDirection: Axis.horizontal),
          );
        }
      )
    );
  }
   Widget _postView(){
    double aH = _h/4;
    return Container(
      margin:EdgeInsets.fromLTRB(20,0,20,0),
      width:_w,
      height:aH,
      child:ListView.builder(
        itemCount: Data.dataPost.length,
        itemBuilder: (builder,index){
          return PostThumbNail(mSizeW: _w/3, mSizeH: aH,mPost: Data.dataPost[index]);
        },
      )
    );
  }

  Widget _postViewTitle(){
    return Row(
      children:<Widget>[
        Expanded(
          flex:3,
          child:Text("Latest News",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20)),
        ),
        Expanded(
          flex:1,
          child:Text("More",style:TextStyle(color:appColor,fontSize:16))
        ),
      ]
    );
  }
 
}