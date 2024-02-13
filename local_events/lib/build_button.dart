import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget buildButton(IconData icon, String label) {
  return Container(
    width: 100,
    height: 110,
    margin: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
    ),
    padding: EdgeInsets.only(top: 15),
    child: Column(
      children: [
        Icon(icon, size: 60),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ],
    ),
  );
}