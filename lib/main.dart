import 'package:flipr_stock_app/load_page.dart';
import 'package:flipr_stock_app/tempScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'homePage.dart';
import 'signinPage.dart';
import 'signupPage.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.teal,
          brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => Load(),
        '/signin' : (context) => SigninPage(),
        '/home' : (context) => HomePage(),
        '/signup' : (context) => SignupPage(),
        '/temp' : (context) => TempScreen()
      },
    );
  }
}

showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    textColor: Colors.tealAccent
  );
}

/*
var random = new Random();

    // Printing Random Number between 1 to 100 on Terminal Window.
    print(random.nextInt(100));
 */