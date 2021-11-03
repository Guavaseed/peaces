import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './View/splashScreen.dart';
import './View/authenticatePage.dart';
import './View/explorePage.dart';
import "./View/profilePage.dart";
import './View/articleDetailPage.dart';
import './View/postDetailPage.dart';

import './Provider/articleProvider.dart';
import './Provider/bottomNavBarIndexProvider.dart';
import './Provider/storyProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value(value:ArticleProvider()),
        ChangeNotifierProvider.value(value:BottomNavBarIndexProvider()),
        ChangeNotifierProvider.value(value:StoryProvider()),
      ],
      child:MaterialApp(
          title: "APP", 
          initialRoute: "/", 
          debugShowCheckedModeBanner: false, 
          routes: {
            '/': (context) => SplashScreen(),
            '/login': (context) => AppPage(),
            '/explore' :(context)=> ExplorePage(),
            '/profile' : (context)=> ProfilePage(),
            '/articleDetail' :(context) => ArticleDetailPage(),
            '/postDetail': (context)=> PostDetailPage(),
        })
    );
  }
}
