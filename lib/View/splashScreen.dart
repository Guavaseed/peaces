import 'dart:async';

import 'package:flutter/material.dart';

import "../constants.dart";
import '../widget/logo.dart';

class SplashScreen extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext con) {
    context = con;
    Nav();

    return Scaffold(
        backgroundColor: baseColor,
        body: Center(
          child: const Logo(use:true,mSize:120),
        ));
  }

  void Nav() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }
}
