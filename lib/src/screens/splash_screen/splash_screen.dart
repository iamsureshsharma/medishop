import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medishop/src/screens/signup/signup.dart';
import 'package:medishop/src/utils/const.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// Uses [MediaQuery] to store the size(height/width) of device

  /// stores the deviceHeight
  var deviceHeight;

  /// stores the deviceWidth
  var deviceWidth;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: deviceHeight,
        width: deviceHeight,
        color: primaryColor,
        child: Center(
          child: Image.asset('assets/icons/logo.png', height: 160, width: 160),
        ),
      ),
    );
  }
}
