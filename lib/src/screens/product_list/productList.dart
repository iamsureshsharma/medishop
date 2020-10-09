import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medishop/src/utils/const.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<String> medname = List();

  @override
  void initState() {
    super.initState();
    medname = ['Paracetamol', 'Zifi', 'Digene', 'citrizin'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffC0C0C0),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
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
        body: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frequently Bought',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 160,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return medCard(medname[index]);
                    },
                    itemCount: medname.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Medicines Available',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Container(
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
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 2,
            offset: Offset(1, 1),
          )
        ],
      ),
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
          Container(
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
        ],
      ),
    );
  }
}
