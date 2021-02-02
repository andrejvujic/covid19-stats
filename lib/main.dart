import 'package:covid19_stats/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid19 podaci',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Poppins',
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      home: Home(),
    );
  }
}
