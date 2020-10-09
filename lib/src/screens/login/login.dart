import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medishop/src/mixins/validation.dart';
import 'package:medishop/src/provider/store.dart';
import 'package:medishop/src/screens/product_list/productList.dart';
import 'package:medishop/src/screens/signup/signup.dart';
import 'package:medishop/src/utils/const.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  /// Uses [MediaQuery] to store the size(height/width) of device

  /// stores the deviceHeight
  var deviceHeight;

  /// stores the deviceWidth
  var deviceWidth;

  AppState provider;

  final formKey = GlobalKey<FormState>();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppState>(context);
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          child: Stack(
            children: [
              Container(
                height: deviceHeight,
                width: deviceWidth,
                color: Colors.white,
              ),
              SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: deviceHeight * 0.37),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: TextFormField(
                            validator: validateEmail,
                            autovalidate: provider.autoValidate,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    )),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1.5,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: primaryColor,
                                      width: 1.5,
                                    )),
                                fillColor: greyColor,
                                filled: true,
                                hintText: 'Email',
                                prefixIcon: ImageIcon(
                                  AssetImage('assets/icons/email.png'),
                                  color: Color(0xff4F4F4F),
                                )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: TextFormField(
                            validator: validateField,
                            autovalidate: provider.autoValidate,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              border: InputBorder.none,
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  )),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.5,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: primaryColor,
                                    width: 1.5,
                                  )),
                              fillColor: greyColor,
                              filled: true,
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.visibility,
                                color: Color(0xff4F4F4F),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      InkWell(
                        onTap: onButtonPress,
                        splashColor: Colors.grey.shade100,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          height: 55,
                          width: deviceWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor,
                          ),
                          child: Center(
                              child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen()));
                        },
                        child: Text(
                          'Don\'t have account?',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -70,
                left: -55,
                right: -20,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    height: 350,
                    width: 500,
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250), bottomRight: Radius.circular(250)), color: primaryColor),
                  ),
                ),
              ),
              Positioned(
                top: 160,
                left: 0,
                right: 0,
                child: Image.asset('assets/icons/logo.png', height: 100, width: 100),
              ),
              Positioned(top: 70, left: 0, right: 0, child: Text(appName, textAlign: TextAlign.center, style: GoogleFonts.righteous(fontSize: 50, fontWeight: FontWeight.w400, color: Colors.white))),
              provider.isLoading ? Center(child: CircularProgressIndicator()) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  onButtonPress() {
    FocusScope.of(context).unfocus();
    provider.setAutoValidate(true);
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      provider.setIsLoading(true);
      Timer(Duration(seconds: 2), () {
        provider.setIsLoading(false, willNotify: false);
        provider.setAutoValidate(false);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ProductList()), (route) => false);
      });
    }
  }
}
