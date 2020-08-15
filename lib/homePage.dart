import 'package:flipr_stock_app/widgets/returns.dart';
import 'package:flipr_stock_app/widgets/withSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime d = DateTime.now();
  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/logo.png", height: 50, width: 60,),
                  Container(
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
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text("SENSEX   ",
                          style: TextStyle(fontSize: 18),
                          ),
                          Text("23416.43",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                    SizedBox(height: 6),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Vol: 16,023,416",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("${DateFormat("d MMM").format(d)}, ${DateFormat("y").format(d)} ${DateFormat("Hm").format(d)}",
                            style: TextStyle(
                                color: Colors.grey, fontSize: 12                                  ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.blueGrey[1000],
            ),
            Container(
              color: Colors.blueGrey[900],
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Overview",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 70,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: data.size.height* 0.67,
              child: ListView(
                children: [
                  Container(
                    height: 260,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 4),
                    ),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      tile("OPEN PRICE", "34,864.87"),
                      tileWithSlider("TODAY'S LOW/HIGH", "34,864.87","39,864.87",  context),
                      tile("PREVIOUS CLOSE", "34,864.87"),
                      tileWithSlider("TODAY'S LOW/HIGH", "34,864.87","39,864.87",  context),
                    ],
                  ),
                  heading("Returns"),
                  GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 4),
                    ),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      returnTile("YTD", "-8.77%", Colors.red),
                      returnTile("1 WEEK", "-8.77%", Colors.red),
                      returnTile("1 MONTH", "1.77%", Colors.green),
                      returnTile("3 MONTHS", "18.77%", Colors.green),
                      returnTile("6 MONTH", "-3.77%", Colors.red),
                      returnTile("1 YEAR", "8.77%", Colors.green),
                      returnTile("2 YEAR", "-1.77%", Colors.red),
                      returnTile("3 YEAR", "5.7%", Colors.green),
                    ],
                  ),
                  heading("Simple Moving Averages"),
                  GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 4),
                    ),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      tile("30 DAYS", "34,864.87"),
                      tile("50 DAYS", "34,864.87"),
                      tile("150 DAYS", "34,864.87"),
                      tile("200 DAYS", "34,864.87"),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget heading(String title){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title, 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
    );
  }
}
