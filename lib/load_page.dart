
import 'package:flipr_stock_app/homePage.dart';
import 'package:flipr_stock_app/signinPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  bool userLoged;

  void getJwtTokenValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool logedIn = prefs.getBool('logedin') ?? false;
    setState(() {
      userLoged = logedIn;
    });

    if(userLoged == true){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomePage())
      );
    }
    else {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => SigninPage())
      );
    }
  }

  @override
  void initState() {
    getJwtTokenValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 100,
          width: 200,
        ),
      ),
    );
  }
}
