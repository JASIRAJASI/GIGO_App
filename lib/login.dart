import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'qrGenerator.dart';
import 'qrScanner.dart';
import 'register.dart';

import 'screenscaling.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //EDIT HERE FOR ALERT STYLE CHANGES

  var alertStyle = AlertStyle(
    descTextAlign: TextAlign.center,
    descStyle: TextStyle(
      fontSize: 16,
    ),
    titleStyle: TextStyle(fontSize: 25),
    animationType: AnimationType.grow,
    animationDuration: Duration(milliseconds: 400),
  );
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(' LOGIN PAGE'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Expanded(
          child: Column(
            children: [
              Image(
                image: AssetImage('images/p2.png'),
                width: SizeConfig.safeBlockHorizontal! * 50,
                height: SizeConfig.safeBlockVertical! * 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'enter your email here',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'enter your password here',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: x,
                onPressed: () async {
                  try {
                    // ignore: unused_local_variable
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                    DocumentSnapshot user = await FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('${FirebaseAuth.instance.currentUser!.uid}')
                        .get();
                    if (user['user_type'] == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QRViewExample()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneratePage()));
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      Alert(
                          style: alertStyle,
                          context: context,
                          title: "Error!",
                          desc: "User Not registered. Please Register",
                          buttons: [
                            DialogButton(
                                child: Text("Register"),
                                onPressed: () {
                                  Alert(
                                      style: alertStyle,
                                      context: context,
                                      title:
                                          "Register as customer or store owner?",
                                      buttons: [
                                        DialogButton(
                                            child: Text(
                                              "Customer",
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RegisterPage(true)));
                                            }),
                                        DialogButton(
                                            child: Text("Store Owner"),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RegisterPage(false)));
                                            })
                                      ]).show();
                                }),
                          ]).show();
                    } else if (e.code == 'wrong-password') {
                      Alert(
                              style: alertStyle,
                              context: context,
                              title: "Error!",
                              desc: "Wrong password! Try again...")
                          .show();
                    }
                  }
                },
                child: Text('LOGIN'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
