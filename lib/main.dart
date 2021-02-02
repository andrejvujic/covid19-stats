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
        primarySwatch: Colors.teal,
        accentColor: Color(0xFF00796B),
        scaffoldBackgroundColor: Color(0xFFB2DFDB),
        canvasColor: Color(0xFFB2DFDB),
        splashColor: Colors.teal.withOpacity(0.2),
        highlightColor: Colors.teal.withOpacity(0.1),
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Color(0xFF212121),
          displayColor: Color(0xFF212121),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Color(0xFF00796B),
        ),
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
          color: Color(0xFF202020),
        ),
        fontFamily: 'Poppins',
      ),
      home: Home(),
    );
  }
}
