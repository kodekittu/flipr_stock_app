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
                  await provider.getDataFromFirestore("ASHOKLEY", "2015-08-14").then((value) {
                    print(provider.stock.openPrice.toString());
                    print(provider.returnData.oneMonth.price.toString());
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
