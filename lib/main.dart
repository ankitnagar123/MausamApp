import 'package:flutter/material.dart';
import 'package:mausam/activity/loading.dart';
import 'package:mausam/activity/homescreen.dart';
//import 'package:mausam/activity/location.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (Context) => Loading(),
      "/homescreen":(Context)=> HomeScreen(),
      "/loading" : (context) => Loading(),
    },
  ));
}

