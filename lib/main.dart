import 'package:flutter/material.dart';
import 'package:food_appui/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App UI',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: const HomeScreen(),
    );
  }
}
