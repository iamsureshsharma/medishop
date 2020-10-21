import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medishop/src/mixins/validation.dart';
import 'package:medishop/src/provider/store.dart';
import 'package:medishop/src/screens/login/login.dart';
import 'package:medishop/src/utils/const.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with ValidationMixin {
  /// Uses [MediaQuery] to store the size(height/width) of device

  /// stores the deviceHeight
  var deviceHeight;

  /// stores the deviceWidth
  var deviceWidth;

  AppState provider;

  final formKey = GlobalKey<FormState>();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String confirmPassword;

  String password;

  FocusNode emailNode = FocusNode();

  FocusNode mobileNode = FocusNode();

  FocusNode passwordNode = FocusNode();

  FocusNode confirmpasswordNode = FocusNode();

  double continerHeight = 430;
  double continerWidth = 500;
  double iconSize = 100;
  double textSize = 50;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    AppState initProvider = Provider.of<AppState>(context, listen: false);
    initProvider.setAutoValidate(false, willNotify: false);
  }

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
              Container(
                margin: EdgeInsets.only(top: 230),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
                      setState(() {
                        continerHeight = 400;
                        Timer(Duration(milliseconds: 200), () {
                          iconSize = 70;
                          textSize = 40;
                        });
                      });
                    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
                      setState(() {
                        continerHeight = 430;
                        continerWidth = 500;
                        Timer(Duration(milliseconds: 200), () {
                          iconSize = 100;
                          textSize = 50;
                        });
                      });
                    }
                    return true;
                  },
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: TextFormField(
                                validator: validateField,
                                autovalidate: provider.autoValidate,
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context).requestFocus(emailNode);
                                },
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
                                    hintText: 'Name',
                                    prefixIcon: Icon(
                                      Icons.person,
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
                                validator: validateEmail,
                                autovalidate: provider.autoValidate,
                                keyboardType: TextInputType.emailAddress,
                                focusNode: emailNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context).requestFocus(mobileNode);
                                },
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
                                validator: validateMobile,
                                autovalidate: provider.autoValidate,
                                keyboardType: TextInputType.phone,
                                focusNode: mobileNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context).requestFocus(passwordNode);
                                },
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
                                    hintText: 'Mobile',
                                    prefixIcon: Icon(
                                      Icons.phone,
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
                                focusNode: passwordNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context).requestFocus(confirmpasswordNode);
                                },
                                onChanged: (value) {
                                  password = value;
                                },
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
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: TextFormField(
                                autovalidate: provider.autoValidate,
                                validator: (value) {
                                  if (value != password)
                                    return 'Passwords must be same';
                                  else
                                    return null;
                                },
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                focusNode: confirmpasswordNode,
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
                                  hintText: 'Confirm password',
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
                                'Signup',
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
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                            },
                            child: Text(
                              'Already have account?',
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
                ),
              ),
              Positioned(
                top: -200,
                left: -52,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: continerHeight,
                    width: continerWidth,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Image.asset('assets/icons/logo.png', height: iconSize, width: iconSize),
              ),
              Positioned(
                  top: 30, left: 0, right: 0, child: Text(appName, textAlign: TextAlign.center, style: GoogleFonts.righteous(fontSize: textSize, fontWeight: FontWeight.w400, color: Colors.white))),
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
        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Signedup successfully!')));
      });
    }
  }
}
