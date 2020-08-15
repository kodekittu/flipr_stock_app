import 'package:flutter/material.dart';

Widget tileWithSlider(String title, String Hval,String Lval, context){
  MediaQueryData data = MediaQuery.of(context);
  return Padding(
    padding: const EdgeInsets.only(left:5.0, right: 5),
    child: Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 2),
          dense: true,
          title: Text(title,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12
            ),
          ),
          subtitle: Column(
            children: [
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Lval,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12, fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(Hval,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12, fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4,),
              Container(
                height: 4,
                width: data.size.width *0.92,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.green,
                          Colors.red,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.topLeft
                    ),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    ),
  );
}

