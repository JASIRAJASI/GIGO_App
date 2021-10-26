import 'package:flutter/material.dart';

import 'drawer.dart';
import 'screenscaling.dart';

class UserProfile extends StatelessWidget {
  final name;
  final email;
  final pno;
  final addres;

  UserProfile({
    @required this.name,
    @required this.email,
    @required this.pno,
    @required this.addres,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CmnDrawer(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              backgroundColor: Colors.black38,
              backgroundImage: AssetImage('images/profile1.png'),
              radius: 110,
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 60,
              child: Text(
                'Profile Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Caveat',
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              indent: 130,
              endIndent: 130,
              thickness: 2,
              color: Colors.grey,
            ),
            Container(
                child: Column(
              children: [
                Text(
                  'Name: $name',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  'Address: $addres',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  'Phone NO: $pno',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  'Email: $email',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
