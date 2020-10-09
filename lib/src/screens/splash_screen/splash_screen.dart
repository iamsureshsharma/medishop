import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medishop/src/screens/login/login.dart';
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
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
    });
  }

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
