import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'homePage.dart';
import 'main.dart';

class SignupPage extends StatefulWidget {
  String brand, devices;
  SignupPage({this.brand, this.devices});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 320,
            child: RotatedBox(
              quarterTurns: 6,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.deepPurple, Colors.deepPurple.shade800],
                    [Colors.indigo.shade800, Colors.tealAccent.shade200],
                  ],
                  durations: [19440, 10800],
                  heightPercentages: [0.20, 0.25],
                  blur: MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 0,
                size: Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              Container(
                height: 620,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/images/logo.png", height: 200, width: 220,),
                    Text("Sign up", textAlign: TextAlign.center, style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0
                    )),
                    Card(
                      margin: EdgeInsets.only(left: 30, right:30, top:20),
                      elevation: 11,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.black26,),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black26),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, right:30, top:20),
                      elevation: 11,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        controller: passwordController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock, color: Colors.black26,),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.black26),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, right:30, top:20),
                      elevation: 11,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        controller: confirmPasswordController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_open, color: Colors.black26,),
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                        ),
                      ),
                    ),
                    isLoading == false ? Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left:30.0, right: 30, top: 20),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        color: Colors.lightBlueAccent,
                        onPressed: () async{
                         if(confirmPasswordController.text !="" && passwordController.text  !="" && emailController.text  !="" )  {
                           if(passwordController.text == confirmPasswordController.text) {
                             await signup(
                                 passwordController.text, emailController.text);
                           }else{
                             showToast("Password is wrong");
                           }
                      //    Navigator.pushAndRemoveUntil(
                      //        context,
                      //        MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                      //            (Route<dynamic> route) => false);
                         }else{
                           showToast("Please fill all details");
                         }
                        },
                        elevation: 11,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        child: Text("Sign up", style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold
                        )),
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(backgroundColor: Colors.lightBlueAccent,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account?"),
                        FlatButton(
                          child: Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold),),
                          textColor: Colors.lightBlueAccent,
                          onPressed: (){
                            Navigator.pushNamed(context, '/signin');
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Future<http.Response> signup(String password, String email,)
  async {
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAneWzjmbqe3PQ3mMYRtCMG9M8495vIzUQ';
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.post(url, headers: {"Content-Type": "application/json"}, body: json.encode({
        'email' : email,
        'password' : password
      }));

      print("${response.statusCode}");
      print("${response.body}");
      final responseData = json.decode(response.body);
      String res = response.body;

      if(responseData['idToken'] != null){
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("idToken", responseData['idToken']);
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                (Route<dynamic> route) => false);
      }else{
        showToast("User Already Exist");
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      showToast(error.toString());
      print(error);
    }
  }
}
