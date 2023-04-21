import 'package:flutter/material.dart';
import 'package:u_and_i/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: Color(0xffffffff),
              fontSize: 80,
              fontWeight: FontWeight.w700,
              fontFamily: 'parisienne'),
          headline2: TextStyle(
            color: Color(0xffffffff),
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: Color(0xffffffff),
            fontSize: 30,
          ),
          bodyText2: TextStyle(
            color: Color(0xffffffff),
            fontSize: 20,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
