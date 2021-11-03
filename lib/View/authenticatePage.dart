import 'package:flutter/material.dart';

import "../constants.dart";
import '../widget/myWidgets.dart';

import '../Service/authenticate.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  final _authenticate = Authenticate();
  final pageController = PageController(initialPage:0);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formState = GlobalKey<FormState>();
  final _formStateReg = GlobalKey<FormState>();

  double _d,_h;
  int index= 0;

  @override
  void dispose(){
     pageController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext con) {
    
    _d = MediaQuery.of(con).size.width;
    _h = MediaQuery.of(con).size.height;

    return Scaffold(
      body:_page(con),
      backgroundColor: baseColor,
    );
  }

  Widget _login(BuildContext con){
    return Container(
      margin:EdgeInsets.fromLTRB(45, 10, 45, 3),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Welcome back",textAlign:TextAlign.left,style:TextStyle(fontWeight:FontWeight.bold, fontSize:28)),
          const Text("Sign in with your account", textAlign:TextAlign.left,style:TextStyle(fontSize:16)),
          SizedBox(height:20),
          Form(
            key:_formState,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Username",textAlign:TextAlign.left,style:TextStyle(fontSize:14)),
                TextFormField(                  
                  decoration: InputDecoration(
                    hintText: "Username@xyz.com"
                  ),
                ),
                SizedBox(height:20),
                const Text("Password",textAlign:TextAlign.left,style:TextStyle(fontSize:14)),
                TextFormField(           
                  obscureText: true,
                  maxLength: 12,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixText: "Show"
                  ),
                ),
                SizedBox(height:20),
                MyButton(
                  buttonText:"LOGIN",
                  color: appColor,
                  height: 60,
                  width: _d,
                  mClicked: (){
                    Navigator.pushNamed(con,'/explore');
                    },
                  ),

              ],
            ),
          ),
          //SizedBox(height:_h/70),
          ////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Forgot your password?"),
              SizedBox(width:20),
              GestureDetector(
                child:SizedBox(
                  width:80,height:50,
                  child:FittedBox(
                    child:  Text("Reset here",style:TextStyle(color:appColor)),
                    fit:BoxFit.contain,
                  ),
                ),
                onTap:(){
                  _authenticate.forgotPasword();
                }
              )
            ],
          ),
          //SizedBox(height:_h/80),

          ///////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(" OR SIGN IN WITH")
            ],
          ),
          SizedBox(height:_h/50),
          /////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child:SizedBox(width:10),
                flex:2
              ),
              Expanded(
                flex:1,
                child:GestureDetector(
                  onTap:(){},
                  child:Image.asset("assets/images/google.png",height:40,width:40),
                ),
              ),
              SizedBox(width:20),
              Expanded(
                flex:1,
                child:GestureDetector(
                  onTap:(){},
                  child:Image.asset("assets/images/facebook.png",height:40,width:40),
                ),
              ),
              SizedBox(width:20),
             Expanded(
               flex: 1,
                child:GestureDetector(
                  onTap:(){},
                  child:Image.asset("assets/images/twitter.png",height:40,width:40),
                ),
              ),
               Expanded(
                child:SizedBox(width:10),
                flex:2
              ),
            ],
          ),
          SizedBox(height:_h/30),

        ],
      )
    );
  }
   Widget _signUp(BuildContext con){
     return Container(
      margin:EdgeInsets.fromLTRB(45, 10, 45, 3),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height:20),
          Form(
            key:_formStateReg,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("SignUp",textAlign:TextAlign.left,style:TextStyle(fontWeight:FontWeight.bold, fontSize:28)),
                SizedBox(height:20),
                const Text("Username",textAlign:TextAlign.left,style:TextStyle(fontSize:14)),
                TextFormField(       
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,           
                  decoration: InputDecoration(
                    hintText: "Username@xyz.com"
                  ),
                ),
                SizedBox(height:20),
                const Text("Password",textAlign:TextAlign.left,style:TextStyle(fontSize:14)),
                TextFormField(    
                  controller:_passwordController,       
                  obscureText: true,       
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixText: "Show"
                  ),
                ),
                SizedBox(height:20),
                const Text("Re-Password",textAlign:TextAlign.left,style:TextStyle(fontSize:14)),
                TextFormField(           
                  obscureText: true,       
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixText: "Show"
                  ),
                ),
                SizedBox(height:20),
                MyButton(
                  buttonText:"SIGNUP",
                  color: appColor,
                  height: 60,
                  width: _d,
                  mClicked: (){},
                  ),

              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _pageView(BuildContext con){
    return PageView(
      controller:pageController,
      scrollDirection:Axis.horizontal,
      children:<Widget>[
        _login(con),
        _signUp(con)
      ]
    );
  }
///////////////////
  Widget _tab(BuildContext con){
    return Container(    
      height:MediaQuery.of(con).size.height/4,
      width: MediaQuery.of(con).size.width,
      child:Card(
        color:appColor,
        elevation:0,
        child:Column(
          children:<Widget>[
            SizedBox(height:20),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children:<Widget>[
                Expanded(
                  flex:1,
                  child:SizedBox(width:1),
                ),
                Expanded(flex:2,
                  child:GestureDetector(
                    child:Container(
                      height:30,width:50,
                      child:Text('LOGIN',textAlign:TextAlign.center,
                          style:TextStyle(fontSize:18,
                          fontWeight:index==0?FontWeight.bold: FontWeight.normal,color:baseColor)),
                    ),
                    onTap:(){
                      index=0;
                      if(pageController.hasClients){
                        pageController.animateToPage(0,
                          duration:Duration(milliseconds:200),curve:Curves.easeInOut,
                          );
                      }
                      setState((){});
                    }
                  )),

                Expanded(flex:2,
                  child:GestureDetector(
                    child:Container(
                      height:30,width:50,
                      child:Text('SIGN UP',textAlign:TextAlign.center,
                        style:TextStyle(fontSize:18,
                              fontWeight:index==1?FontWeight.bold: FontWeight.normal,color:baseColor))
                    ),
                    onTap:(){
                      index = 1;
                      if(pageController.hasClients){
                        pageController.animateToPage(1,
                          duration: Duration(milliseconds:200),
                          curve:Curves.easeInOut,
                        );
                      }
                      setState((){});
                    }
                  )),

                   Expanded(
                    flex:1,
                    child:SizedBox(width:1),
                  ),
              ]
            ),
          ]
        ),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(30),
        )
      )
    );
  }
  /////////////////////
   Widget _tabView(BuildContext con){
    return Container(    
      child:Card(
        child: Container(
          margin:EdgeInsets.all(20),
          child:_pageView(con),
        ),
        color:baseColor,
        elevation:0,        
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(30),
        )
      )
    );
  }
  ///////////////
  Widget _page(BuildContext con){
    return Container(
      child:Stack(
        children:<Widget>[
          Positioned(child:Container(height:MediaQuery.of(con).size.height)),
          Positioned(
            top:20,
            child:Container(
              height: _h-20,
              width:_d,
              child:Column(
                children: <Widget>[
                  SizedBox(height:_h/20),
                  const Logo(use:true,mSize:120),
                  SizedBox(height:_h/30),
                  _tab(con),
                ],
              )
            ),
          ),
         Positioned(
           top:_h-(_h/2)-120,
           child:Container(
             height:_h,
             width:_d,
             child:_tabView(con),
           ),
         ),
         
        ]
      )
    );
  }
}
