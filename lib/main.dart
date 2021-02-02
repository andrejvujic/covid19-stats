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
        accentColor: Colors.amber,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Color(0xFF121212),
        cardColor: Color(0xFF202020),
        canvasColor: Color(0xFF202020),
        dialogBackgroundColor: Color(0xFF202020),
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF202020),
        ),
        fontFamily: 'Poppins',
      ),
      home: Home(),
    );
  }
}
