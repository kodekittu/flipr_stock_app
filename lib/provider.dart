import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipr_stock_app/model/return.dart';
import 'package:flipr_stock_app/model/retutnSingleStock.dart';
import 'package:flipr_stock_app/model/stock.dart';
import 'package:intl/intl.dart';

import 'model/ChartGraphData.dart';

class ProviderTemp {
  final firestoreInstance = Firestore.instance;
  int i;
  ProviderTemp(this.i);
  Stock stock;
  Return returnData;
  Future<void> getDataFromFirestore(String collectionName,String date) async {
    try{
      DateTime dateTime = DateTime.parse(date);
      await firestoreInstance.collection(collectionName).document(date).get().then((value) async {
        Map<String, Object> result = value.data;
        stock = Stock(
            dateTime,
            double.parse(result['Open']),
            double.parse(result['Close']),
            int.parse(result['Volume']),
            double.parse(result['High']),
            double.parse(result['Low']),
            double.parse(result['AdjClose'])
        );
        await stockToReturn(dateTime, stock.openPrice,collectionName);
      });
    }
    catch(e){
      print(e);
    }

  }
  Future<List<ChartGraphData> > getListOfStockData(String collectionName, DateTime dateTime) async{
    List<ChartGraphData > listOfData = [];
    print("yes");
    await firestoreInstance.collection(collectionName).getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        Map<String, Object> val = result.data;
        try{
          DateTime dateTimeObject = DateTime.parse(result.documentID);
          double data = double.parse(val['Open']);
          listOfData.add(ChartGraphData(dateTimeObject, data));
        }
        catch(e){
          print(e);
        }
        //listOfData.add(ChartGraphData(DateTime.parse(result.documentID), data));
      });
      print(listOfData.length);
    });
    return listOfData;

  }
  Future<void> stockToReturn(DateTime dateTime, double stockPriceOfDay, String collectionName) async{
    ReturnSingleStock YTD;
    ReturnSingleStock oneWeek;
    ReturnSingleStock oneMonth;
    ReturnSingleStock threeMonth;
    ReturnSingleStock sixMonth;
    ReturnSingleStock oneYear;
    ReturnSingleStock twoYear;
    ReturnSingleStock threeYear;

    YTD = await returnPercentageCalculation(DateTime(dateTime.year-1, dateTime.month, dateTime.day), stockPriceOfDay, collectionName);
    oneWeek = await returnPercentageCalculation(DateTime(dateTime.year, dateTime.month, dateTime.day-7), stockPriceOfDay, collectionName);
    oneMonth = await returnPercentageCalculation(DateTime(dateTime.year, dateTime.month, dateTime.day-28), stockPriceOfDay, collectionName);
    threeMonth = await returnPercentageCalculation(DateTime(dateTime.year, dateTime.month, dateTime.day-84), stockPriceOfDay, collectionName);
    sixMonth = await returnPercentageCalculation(DateTime(dateTime.year, dateTime.month, dateTime.day-168), stockPriceOfDay, collectionName);
    oneYear = await returnPercentageCalculation(DateTime(dateTime.year, dateTime.month, dateTime.day-336), stockPriceOfDay, collectionName);
    twoYear = await returnPercentageCalculation(DateTime(dateTime.year, dateTime.month, dateTime.day-672), stockPriceOfDay, collectionName);
    threeYear = await returnPercentageCalculation(DateTime(dateTime.year, dateTime.month, dateTime.day-1008), stockPriceOfDay, collectionName);

    returnData =  Return(
      YTD,
    oneWeek,
    oneMonth,
    threeMonth,
    sixMonth,
    oneYear,
    twoYear,
    threeYear);
  }

  Future<ReturnSingleStock> returnPercentageCalculation(DateTime x, double stockPriceOfDay, String collectionName) async{
    double stockPriceValue;
    try{
       await firestoreInstance.collection(collectionName).document(DateFormat("y-MM-dd").format(x)).get().then((value)  {
        stockPriceValue = double.parse(value.data['Open']);
        //return stockPriceValue;
      });
      double percentage = ((stockPriceValue - stockPriceOfDay)*100.0)/stockPriceValue;
      print(DateFormat("y-MM-dd").format(x)+ "  percentage === $percentage");
      return ReturnSingleStock(percentage,true);
    }
    catch(e) {
      print(e);
      print(DateFormat("y-MM-dd").format(x)+ "  percentage === 0");
      return ReturnSingleStock(0,false);
    }
  }

}