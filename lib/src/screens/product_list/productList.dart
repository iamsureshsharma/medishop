import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medishop/src/model/med.dart';
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

  List<Med> topMedName = List();

  List<Med> commonMedNames = List();

  @override
  void initState() {
    super.initState();
    topMedName = [
      Med(name: 'Paracetamol', strength: '650 mg', price: 120, quantity: 1),
      Med(name: 'Zifi', strength: '200 mg', price: 150, quantity: 1),
      Med(name: 'Digene', strength: '40 mg', price: 120, quantity: 1),
      Med(name: 'Citrizin', strength: '10 mg', price: 90, quantity: 1),
      Med(name: 'Sumo', strength: '500 mg', price: 120, quantity: 1),
    ];
    commonMedNames = [
      Med(name: 'Lipitor', strength: '20 mg', quantity: 1, price: 112),
      Med(name: 'Sumo', strength: '500 mg', price: 120, quantity: 1),
      Med(name: 'Metformin', strength: '850 mg', price: 260, quantity: 1),
      Med(name: 'Zifi', strength: '200 mg', price: 150, quantity: 1),
      Med(name: 'Omeprazole', strength: '80 mg', price: 220, quantity: 1),
      Med(name: 'Digene', strength: '40 mg', price: 120, quantity: 1),
      Med(name: 'Prinivil', strength: '20 mg', price: 150, quantity: 1),
      Med(name: 'Citrizin', strength: '10 mg', price: 90, quantity: 1),
      Med(name: 'Synthroid', strength: '100 mcg', price: 120, quantity: 1),
      Med(name: 'Sumo', strength: '500 mg', price: 120, quantity: 1),
    ];
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
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                })
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
                      return medCard(topMedName[index]);
                    },
                    itemCount: topMedName.length,
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
                      return medAvailable(commonMedNames[index]);
                    },
                    itemCount: commonMedNames.length,
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

  Widget medAvailable(Med med) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Card(
        elevation: 3,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(med: med ?? '')));
          },
          title: Text(med?.name ?? ''),
          subtitle: Text(
            med?.strength ?? '',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹ ${med.price ?? ''}',
                style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 3),
              Text(
                '(Qt: ${med?.quantity} Strip)',
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

  Widget medCard(Med med) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(med: med ?? '')));
      },
      child: Container(
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
                    Text(med?.name ?? ''),
                    SizedBox(height: 3),
                    Text(
                      med?.strength ?? '',
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
      ),
    );
  }
}

class Search extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text('');
      },
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
