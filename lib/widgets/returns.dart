import 'package:flutter/material.dart';

Widget returnTile(String title, String val, Color color){
  return Padding(
    padding: const EdgeInsets.only(left:4.0, right: 4),
    child: Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 2,),
          dense: true,
          title: Text(title,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12
            ),
          ),
          subtitle: Text(val,
            style: TextStyle(
                color: color,
                fontSize: 12.8,
            ),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    ),
  );
}