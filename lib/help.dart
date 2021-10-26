import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final _url = 'tel:+91 1234567890';
  final _urlmail = 'mailto:artheroov@gmail.com';
  void _launchURL() async => await launch(_url);
  void _launchmail() async => await launch(_urlmail);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
            "Help Details",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
            ),
          ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black38,
              backgroundImage: AssetImage('images/profile2.png'),
              radius: 100,
            ),
            SizedBox(
              height: 40,
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: Colors.grey.shade400,
              child: ListTile(
                enableFeedback: true,
                horizontalTitleGap: 40,
                leading: Icon(
                  Icons.notifications_none,
                  size: 50,
                  color: Colors.grey.shade800,
                ),
                title: Text(
                  'IF there is any error or any issues about the app countact the developers we are available 24/7.Contacting us through mail is most prefered',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: Colors.grey.shade400,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.deepPurple.shade400),
                ),
                onPressed: _launchURL,
                child: ListTile(
                  enableFeedback: true,
                  horizontalTitleGap: 40,
                  leading: Icon(
                    Icons.call_outlined,
                    size: 50,
                    color: Colors.grey.shade800,
                  ),
                  title: Text(
                    '+91 1234567890',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.deepPurple.shade400),
                ),
                onPressed: _launchmail,
                child: ListTile(
                  enableFeedback: true,
                  horizontalTitleGap: 40,
                  leading: Icon(
                    Icons.email_rounded,
                    size: 50,
                    color: Colors.grey.shade800,
                  ),
                  title: Text(
                    'artheroov@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
