import 'package:flutter/material.dart';

Widget tile(String title, String val){
  return Padding(
    padding: const EdgeInsets.only(left:4.0, right: 4),
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
          subtitle: Text(val,
            style: TextStyle(
                color: Colors.white,
                fontSize: 12, fontWeight: FontWeight.bold
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