import 'package:covid/screens/main.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    CovidApp()
  );
}

class CovidApp extends StatelessWidget {
  const CovidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
