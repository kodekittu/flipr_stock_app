import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget notificationBar(){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Column( mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left :5.0, top: 5),
            child: Row(
              children: [
                Text("NSE",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left : 5.0),
            child: Row(
              children: [
                Text("NIFTY 50",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13, fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("11,358.98",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25, fontWeight: FontWeight.bold
                  ),
                ),
                Column(
                  children: [
                    Text("Prev Close",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11
                      ),
                    ),
                    Text("11,300.67",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.black87,
            height: 20,
          )
        ],
      ),
    ),
  );
}