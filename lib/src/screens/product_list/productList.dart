import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medishop/src/provider/store.dart';
import 'package:medishop/src/screens/address/address.dart';
import 'package:medishop/src/screens/myprofile/myprofile.dart';
import 'package:medishop/src/screens/product_detail/product_detail.dart';
import 'package:medishop/src/screens/recent_orders/recent_orders.dart';
import 'package:medishop/src/utils/const.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  /// Uses [MediaQuery] to store the size(height/width) of device

  /// stores the deviceHeight
  var deviceHeight;

  /// stores the deviceWidth
  var deviceWidth;

  AppState provider;

  List<String> medname = List();

  @override
  void initState() {
    super.initState();
    medname = ['Paracetamol', 'Zifi', 'Digene', 'Citrizin', 'Sumo'];
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppState>(context);
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          title: Text(
            'Browse Medicines',
            style: GoogleFonts.righteous(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        drawer: Container(
          width: deviceWidth * 0.62,
          child: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
                    color: primaryColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Icon(
                            Icons.person,
                            color: primaryColor,
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, bottom: 10),
                          width: deviceWidth * 0.4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(provider.userEmail.split('@')[0] ?? '', style: TextStyle(color: Colors.white)),
                              Text(provider.userEmail ?? '', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProfile()));
                    },
                    leading: ImageIcon(AssetImage('assets/icons/person.png'), size: 25, color: primaryColor),
                    title: Text('My Profile'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecentOrders()));
                    },
                    leading: Icon(Icons.restore, size: 25, color: primaryColor),
                    title: Text('Recent Orders'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressScreen()));
                    },
                    leading: ImageIcon(AssetImage('assets/icons/address.png'), size: 25, color: primaryColor),
                    title: Text('My Address'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    onTap: () {
                      SystemNavigator.pop();
                    },
                    leading: ImageIcon(AssetImage('assets/icons/logout.png'), size: 25, color: primaryColor),
                    title: Text('Exit'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                  child: Text(
                    'Frequently Bought',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 165,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return medCard(medname[index]);
                    },
                    itemCount: medname.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                  child: Text(
                    'Medicines Available',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return medAvailable();
                    },
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget medAvailable() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Card(
        elevation: 3,
        child: ListTile(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetail()));
          },
          title: Text('Paracetamol'),
          subtitle: Text(
            '500 mg',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹ 80',
                style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 3),
              Text(
                '(Qt: 1)',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget medCard(String name) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Image.asset(
              'assets/icons/medIcon.png',
            ),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 100,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  SizedBox(height: 3),
                  Text(
                    '500 mg',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Color(0xffA1FFF4), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
            ),
          ),
        ],
      ),
    );
  }
}
