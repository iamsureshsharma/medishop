import 'package:flutter/material.dart';
import 'package:medishop/src/utils/const.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          height: 50,
          color: primaryColor,
          child: Center(
              child: Text(
            'Checkout',
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
          )),
        ),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(
            'Checkout',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                        child: Image.asset(
                          'assets/icons/medIcon.png',
                        ),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Paracetamol', style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: itemCount > 1
                                    ? () {
                                        setState(() {
                                          itemCount -= 1;
                                        });
                                      }
                                    : null,
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    child: Icon(Icons.remove, color: Colors.white),
                                    decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)))),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border(top: BorderSide(color: Colors.grey), bottom: BorderSide(color: Colors.grey)),
                                ),
                                child: Text(itemCount.toString() ?? '', style: TextStyle(fontSize: 13)),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    itemCount += 1;
                                  });
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    child: Icon(Icons.add, color: Colors.white),
                                    decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)))),
                              ),
                              SizedBox(width: 10),
                              Text('X', style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                              SizedBox(width: 15),
                              Text('₹ 100' ?? '', style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey.shade600)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Subtotal : ₹ ${100 * itemCount}', style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey.shade500)),
                        SizedBox(height: 10),
                        Text('Delivery: ₹ 50 ', style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey.shade500)),
                        SizedBox(height: 10),
                        Text('Total Value: ₹ ${100 * itemCount + 50}', style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w500)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
