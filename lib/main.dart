import 'package:flutter/material.dart';
import 'package:dictionary/Screens/Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Dictionary",style: TextStyle(color: Colors.white),),
      ),
      body: Home(),
    ),
  ));
}