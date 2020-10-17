import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(
            'Recent orders',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Text(
            'This page is under construction 🚧',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
