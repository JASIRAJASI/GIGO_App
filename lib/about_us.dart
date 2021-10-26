import 'package:flutter/material.dart';
import 'package:gigoapplatest/drawer.dart';
import 'screenscaling.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new CmnDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage('images/p1.png'),
              width: SizeConfig.safeBlockHorizontal! * 50,
              height: SizeConfig.safeBlockVertical! * 30,
            ),
            Text(
              'SHRAVAN SREEDEEP  ||  JASIRA T P',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              'FLUTTER APP DEVELOPERS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
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
            Text(
              "We are students of Government College of Engineering, Kannur. This Project was made as a part of Build From Zero event hosted by Tinkerhub GCEK",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
