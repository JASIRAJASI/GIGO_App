import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gigoapplatest/drawer.dart';
import 'screenscaling.dart';

import 'mreader.dart';

class Page2Screen extends StatefulWidget {
  final data, data2;
  Page2Screen({@required this.data, @required this.data2});
  @override
  _Page2ScreenState createState() =>
      _Page2ScreenState(storeid: data, x1: data2);
}

class _Page2ScreenState extends State<Page2Screen> {
  var storeid;
  DocumentSnapshot? x1;
  _Page2ScreenState({@required this.storeid, @required this.x1});
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CmnDrawer(),
      appBar: AppBar(
        title: Text('Store Details'),
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Store Name: ${x1!['name']}',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Center(
                child: Text(
                  "Phone Number: ${x1!['pno']}",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Center(
                child: Text(
                  "Email ID: ${x1!['email']}",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Center(
                child: Text(
                  "Location: ${x1!['addres']}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                style: x,
                onPressed: () async {
                  DocumentSnapshot user = await FirebaseFirestore.instance
                      .collection('USERS')
                      .doc('${FirebaseAuth.instance.currentUser!.uid}')
                      .get();
                  DocumentSnapshot store = await FirebaseFirestore.instance
                      .collection('USERS')
                      .doc('$storeid')
                      .get();
                  FirebaseFirestore.instance
                      .collection('USERS')
                      .doc('${FirebaseAuth.instance.currentUser!.uid}')
                      .collection('visited')
                      .doc()
                      .set({
                    'name': store['name'],
                    'address': store['addres'],
                    'phno': store['pno'],
                    'visitedId': store['userId'],
                    'time': DateTime.now().toString(),
                  });
                  print(store['name']);
                  print(user['name']);
                  FirebaseFirestore.instance
                      .collection('USERS')
                      .doc('$storeid')
                      .collection('visited')
                      .doc()
                      .set({
                    'name': user['name'],
                    'address': user['addres'],
                    'phno': user['pno'],
                    'visitedId': user['userId'],
                    'time': DateTime.now().toString(),
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserInformation()));
                },
                child: Text('Add Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
