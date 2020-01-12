import 'package:flutter/material.dart';

import "./screens/home_screen.dart";

void main () => runApp(TravelApp());

class TravelApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Travel Application",
      debugShowCheckedModeBanner: false,
      theme: ThemeData (
        primaryColor: Colors.blue,
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
    );
  }
  
}