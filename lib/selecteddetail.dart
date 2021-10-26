import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screenscaling.dart';

class WQ extends StatefulWidget {
  final data;
  WQ({@required this.data});
  @override
  _WQState createState() => _WQState(id: data);
}

class _WQState extends State<WQ> {
  var id;
  _WQState({@required this.id});
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('$id');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          body: new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return Card(
                child: new ListTile(
                  title: new Text(
                      '${document.get('name')}  ${document.get('pno')}'),
                  subtitle: new Text(
                      '${document.get('email')}  ${document.get('addres')}'),
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
