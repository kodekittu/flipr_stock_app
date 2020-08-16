import 'package:flipr_stock_app/chart/chart.dart';
import 'package:flipr_stock_app/model/return.dart';
import 'package:flipr_stock_app/model/retutnSingleStock.dart';
import 'package:flipr_stock_app/model/stock.dart';
import 'package:flipr_stock_app/provider.dart';
import 'package:flipr_stock_app/widgets/notificationBar.dart';
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
  ProviderTemp provider = ProviderTemp(0);
  Stock st =  Stock(DateTime.now(), 38456.64, 61.09, 245006352, 62.0, 52.29,61.09);
  Return  rtn;
  Return rt = Return(
    ReturnSingleStock(17.82, true),ReturnSingleStock(-7.39, true),
    ReturnSingleStock(-22.26, true),ReturnSingleStock(31.96, true),
    ReturnSingleStock(16.60, true),ReturnSingleStock(51.68, true),
    ReturnSingleStock(55.83, true),ReturnSingleStock(-6.85, true),
  );
  Stock sto;
  String companyData = "null";
  bool nTap = false;
  final TextStyle dropdownMenuLabel =
  TextStyle(color: Colors.white, fontSize: 18);
  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.white, fontSize: 18);
  List<String> company = ["ASHOKLEY", "BSE (Sensex)", "BSESN", "CIPLA", "EICHERMOT", "NSE (Nifty)", "NSEI", "RELIANCE", "TATASTEEL"];
  var selectedCompIndex = 0;


// void getData(String comp, DateTime date) async{
//   await provider.getDataFromFirestore("ASHOKLEY", date.toString()).then((value) {

//       st = Stock(
//         d,
//         provider.stock.openPrice,
//         provider.stock.closePrice,
//         provider.stock.volume,
//         provider.stock.high,
//         provider.stock.low,
//         provider.stock.adjClose,
//       );
//       rt = Return(
//         provider.returnData.YTD,
//         provider.returnData.oneWeek,
//         provider.returnData.oneMonth,
//         provider.returnData.threeMonth,
//         provider.returnData.sixMonth,
//         provider.returnData.oneYear,
//         provider.returnData.twoYear,
//         provider.returnData.threeMonth,
//       );
//     print(provider.stock.openPrice.toString());
//     print(provider.stock.closePrice.toString());
//     print(provider.stock.high.toString());
//   });
// }

  Future <bool> _onPressedBack(){
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do you really want to exit?"),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("NO")
          ),
          FlatButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text("YES")
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    final orientation = MediaQuery.of(context).orientation;
    return WillPopScope(
      onWillPop: _onPressedBack,
      child: Scaffold(
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
                            icon: Icon(
                              nTap != false ? Icons.notifications_active : Icons.notifications_none,
                              color: Colors.white,
                            ),
                            onPressed: (){
                              setState(() {
                                nTap = !nTap;
                              });
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
              nTap == true ? notificationBar(): Container(),
              Container(
                alignment: Alignment.topLeft,
                color: Colors.blueGrey[900],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                    ListTile(
                      dense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 1),
                        title: dropDown(),
                        subtitle: Text( st.openPrice.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold
                          ),
                        ),
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
                height: nTap == false ? data.size.height* 0.63 : data.size.height* 0.46,
                child: ListView(
                  children: [
                    Container(
                      child: graphChart(context),
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
                        tile("OPEN PRICE", st.openPrice != null ? st.openPrice.toString() : "null"),
                        tileWithSlider("TODAY'S LOW/HIGH", st.low.toString(),st.high.toString(),  context),
                        tile("PREVIOUS CLOSE", st.closePrice.toString()),
                        tileWithSlider("52 KW LOW/HIGH", st.low.toString(),st.high.toString(),  context),
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
                       returnTile("YTD", double.parse((rt.YTD.price).toStringAsFixed(2)).toString(), rt.YTD.price < 0 ? Colors.red : Colors.green),
                       returnTile("1 WEEK", double.parse((rt.oneWeek.price).toStringAsFixed(2)).toString(), rt.oneWeek.price < 0 ? Colors.red : Colors.green),
                       returnTile("1 MONTH", double.parse((rt.oneMonth.price).toStringAsFixed(2)).toString(), rt.oneMonth.price < 0 ? Colors.red : Colors.green),
                       returnTile("3 MONTHS", double.parse((rt.threeMonth.price).toStringAsFixed(2)).toString(), rt.threeMonth.price < 0 ? Colors.red : Colors.green),
                       returnTile("6 MONTH", double.parse((rt.sixMonth.price).toStringAsFixed(2)).toString(), rt.sixMonth.price < 0 ? Colors.red : Colors.green),
                       returnTile("1 YEAR", double.parse((rt.oneYear.price).toStringAsFixed(2)).toString(), rt.oneYear.price < 0 ? Colors.red : Colors.green),
                       returnTile("2 YEAR", double.parse((rt.twoYear.price).toStringAsFixed(2)).toString(), rt.twoYear.price < 0 ? Colors.red : Colors.green),
                       returnTile("3 YEAR", double.parse((rt.threeYear.price).toStringAsFixed(2)).toString(), rt.threeYear.price < 0 ? Colors.red : Colors.green),
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
                        tile("50 DAYS", "44,84.87"),
                        tile("150 DAYS", "3o,864.07"),
                        tile("200 DAYS", "14,004.01"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDown(){
    ProviderTemp provider = ProviderTemp(0);
    return
      PopupMenuButton(
        onSelected: (index)
          async{
            setState(() {
              selectedCompIndex = index;
            });
            await provider.getDataFromFirestore(company[index], "2020-08-13").then((value){
               sto = Stock(
                d,
                provider.stock.openPrice != null ? double.parse((provider.stock.openPrice).toStringAsFixed(2)) : "null",
                provider.stock.closePrice != null ? double.parse((provider.stock.closePrice).toStringAsFixed(2)) : "null",
                provider.stock.volume!= null ? provider.stock.volume : "null",
                provider.stock.high!= null ? double.parse((provider.stock.high).toStringAsFixed(2)) : "null",
                provider.stock.low!= null ? double.parse((provider.stock.low).toStringAsFixed(2)) : "null",
                provider.stock.adjClose!= null ? double.parse((provider.stock.adjClose).toStringAsFixed(2)) : "null",
              );
               rtn = Return(
                provider.returnData.YTD ,//!= null ? double.parse((provider.returnData.YTD.price).toStringAsFixed(2)) : "null",
                provider.returnData.oneWeek   ,// != null ? double.parse((provider.returnData.oneWeek.price).toStringAsFixed(2)) : "null",
                provider.returnData.oneMonth  ,//  != null ? double.parse((provider.returnData.oneMonth.price).toStringAsFixed(2)) : "null",
                provider.returnData.threeMonth,//       != null ? double.parse((provider.returnData.threeMonth.price).toStringAsFixed(2)) : "null",
                provider.returnData.sixMonth  ,//   != null ? double.parse((provider.returnData.sixMonth.price).toStringAsFixed(2)) : "null",
                provider.returnData.oneYear   ,//    != null ? double.parse((provider.returnData.oneYear.price).toStringAsFixed(2)) : "null",
                provider.returnData.twoYear   ,//    != null ? double.parse((provider.returnData.twoYear.price).toStringAsFixed(2)) : "null",
                provider.returnData.threeYear ,//    != null ? double.parse((provider.returnData.threeYear.price).toStringAsFixed(2)) : "null",
              );
              print("jbsvh45678987632345678i9o");
               print(provider.returnData.YTD.price.toString());
            });
            setState(() {
              st = sto;
              rt = rtn;
            });
        },
        child: Row(
          children: <Widget>[
            Text(
              company[selectedCompIndex],
              style: dropdownMenuLabel,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 40,
              color: Colors.black,
            )
          ],
        ),
        itemBuilder: (BuildContext context) =>
        <PopupMenuItem<int>>[
          menuItem(0),
          menuItem(1),
          menuItem(2),
          menuItem(3),
          menuItem(4),
          menuItem(5),
          menuItem(6),
          menuItem(7),
          menuItem(8),
        ],
      );
  }
  Widget menuItem(int x){
    return PopupMenuItem(
      child: Text(
        company[x],
        style: dropdownMenuItem,
      ),
      value: x,
    );
  }
  Widget heading(String title){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title, 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 19
        ),
      ),
    );
  }
}
