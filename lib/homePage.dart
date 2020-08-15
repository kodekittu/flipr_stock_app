import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row( mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications_none, color: Colors.white,),
                    onPressed: (){

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white,),
                    onPressed: (){

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle, color: Colors.white,),
                    onPressed: (){

                    },
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blueGrey[900],
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("SENSEX",
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text("23416.43",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Row( mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(DateTime.now().toString())
                          ],
                        )
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
