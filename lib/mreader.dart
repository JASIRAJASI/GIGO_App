import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'drawer.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    //var c;
    var alertStyle = AlertStyle(
      descTextAlign: TextAlign.center,
      descStyle: TextStyle(
        fontSize: 16,
      ),
      titleStyle: TextStyle(fontSize: 25),
      animationType: AnimationType.grow,
      animationDuration: Duration(milliseconds: 400),
    );
    Query users = FirebaseFirestore.instance
        .collection('USERS')
        .doc('${FirebaseAuth.instance.currentUser!.uid}')
        .collection('visited')
        .orderBy('time', descending: true);
    //.collection('visited');
    print(FirebaseAuth.instance.currentUser!.uid);
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          Alert(
                  context: context,
                  closeFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserInformation()));
                  },
                  title: "Error!",
                  style: alertStyle,
                  desc: "Failed to load data. Try again!")
              .show();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                  child: SpinKitRing(color: Colors.blueAccent, size: 100)),
            ),
          );
        }

        return Scaffold(
          drawer: new CmnDrawer(),
          appBar: AppBar(
            title: Text('Visited Customers'),
          ),
          body: ListView(
            addAutomaticKeepAlives: false,
            cacheExtent: 300,
            reverse: false,
            //physics: ,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return Card(
                child: ListTile(
                  title: Text('${document.get('name')}'),
                  subtitle: Text(
                      'Address : ${document.get('address')}\nVisited on ${document.get('time')}'),
                  trailing: Text('Phone Number:${document.get('phno')}'),
                  isThreeLine: true,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
