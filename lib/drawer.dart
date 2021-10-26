import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gigoapplatest/mreader.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'help.dart';
import 'screenscaling.dart';
import 'about_us.dart';
import 'main.dart';
import 'userprofile.dart';

class CmnDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontStyle: FontStyle.italic),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                margin: EdgeInsets.only(right: 12),
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: ListTile(
                  title: Text('My Profile',
                      style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 20)),
                  onTap: () async {
                    DocumentSnapshot user = await FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('${FirebaseAuth.instance.currentUser!.uid}')
                        .get();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfile(
                                  name: user['name'],
                                  email: user['email'],
                                  pno: user['pno'],
                                  addres: user['addres'],
                                )));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                margin: EdgeInsets.only(right: 12),
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: ListTile(
                  title: Text('Visited Customers',
                      style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 20)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserInformation()));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                margin: EdgeInsets.only(right: 12),
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: ListTile(
                  title: Text('About Developers',
                      style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 20)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                margin: EdgeInsets.only(right: 12),
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: ListTile(
                  title:
                      Text('Help', style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 20)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Help()));
                  },
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                margin: EdgeInsets.only(right: 12),
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: ListTile(
                  title: Text('Log out',
                      style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 20)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChoosingPage()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
