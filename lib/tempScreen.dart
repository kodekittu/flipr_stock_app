import 'package:flipr_stock_app/provider.dart';
import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  ProviderTemp provider = ProviderTemp(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Text('jhb'),
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: () async{
                  await provider.getDataFromFirestore("ASHOKLEY", "2020-08-10").then((value) {
                    print(provider.stock.openPrice.toString());
                    print(provider.stock.closePrice.toString());
                    print(provider.stock.high.toString());
                    print(provider.stock.low.toString());
                    print(provider.stock.volume.toString());
                    print(provider.stock.adjClose.toString());
                    print(provider.returnData.oneMonth.price.toString());
                    print(provider.returnData.threeMonth.price.toString());
                    print(provider.returnData.sixMonth.price.toString());
                    print(provider.returnData.oneYear.price.toString());
                    print(provider.returnData.twoYear.price.toString());
                    print(provider.returnData.threeYear.price.toString());
                    print(provider.returnData.oneWeek.price.toString());
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
