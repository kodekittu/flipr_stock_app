import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipr_stock_app/model/return.dart';
import 'package:flipr_stock_app/model/retutnSingleStock.dart';
import 'package:flipr_stock_app/model/stock.dart';
import 'package:intl/intl.dart';

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
    oneMonth = await returnPercentageCalculation(DateTime(dateTime.year, dateTime.month-1, dateTime.day), stockPriceOfDay, collectionName);
    threeMonth = await returnPercentageCalculation(DateTime(dateTime.year, dateTime.month-3, dateTime.day), stockPriceOfDay, collectionName);
    sixMonth = await returnPercentageCalculation(DateTime(dateTime.year, dateTime.month-6, dateTime.day), stockPriceOfDay, collectionName);
    oneYear = await returnPercentageCalculation(DateTime(dateTime.year-1, dateTime.month, dateTime.day), stockPriceOfDay, collectionName);
    twoYear = await returnPercentageCalculation(DateTime(dateTime.year-2, dateTime.month, dateTime.day), stockPriceOfDay, collectionName);
    threeYear = await returnPercentageCalculation(DateTime(dateTime.year-3, dateTime.month, dateTime.day), stockPriceOfDay, collectionName);

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
      final res = await firestoreInstance.collection(collectionName).document(x.toString()).get().then((value) async {
        stockPriceValue = double.parse(value.data['Open']);
        //return stockPriceValue;
      });
      double percentage = ((stockPriceValue - stockPriceOfDay)*100.0)/stockPriceValue;
      print('date'+x.toIso8601String()+'  percenteahe = $percentage');
      return ReturnSingleStock(percentage,true);
    }
    catch(e) {
      return ReturnSingleStock(0,false);
    }
  }

}