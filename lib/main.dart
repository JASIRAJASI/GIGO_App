import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'screenscaling.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green),
      home: ChoosingPage()));
}

class ChoosingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var x = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          
        )
      ),
      backgroundColor:
          MaterialStateProperty.all<Color>(Colors.green),
    );
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('GIGO APP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/applogo.png'),
              width: SizeConfig.safeBlockHorizontal! * 70,
              height: SizeConfig.safeBlockVertical! * 50,
            ),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.5,
              height: SizeConfig.screenHeight! * 0.09,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: x,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('Log in',style: TextStyle(fontSize: 20),),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage(true))); // SIGN UP SCREEN GOES HERE
              },
              child: Text(
                'Register as store owner',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage(false))); // SIGN UP SCREEN GOES HERE
              },
              child: Text(
                'Register as customer',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
